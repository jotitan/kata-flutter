package main

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"strconv"
	"strings"
)

var offers = map[int]Offer{
	1: {Id: 1, Name: "Cinéma", HasImage: false, Products: []Product{
		{Name: "UGC", Price: 4, Quantity: 25},
		{Name: "Gaumont", Price: 6.5, Quantity: 10},
	}},
	2: {Id: 2, Name: "Parc", HasImage: false, Products: []Product{
		{Name: "Astérix", Price: 32, Quantity: 4},
		{Name: "Disneyland", Price: 65, Quantity: 4},
	}},
	3: {Id: 3, Name: "Opéra", HasImage: false, Products: []Product{}},
}

func main() {
	if len(os.Args) != 2 {
		log.Fatal("Need port in command line")
		return
	}
	runServer(os.Args[1])
}

func runServer(port string) {
	server := http.ServeMux{}
	server.HandleFunc("/offers", getOffers)
	server.HandleFunc("/", dispatch)

	log.Println(fmt.Sprintf("Start server on port %s", port))
	http.ListenAndServe(":"+port, &server)
}

func getOffers(w http.ResponseWriter, r *http.Request) {
	offersDto := make([]LightOfferDto, 0, len(offers))
	for _, offer := range offers {
		offersDto = append(offersDto, offer.ToLightDto())
	}
	data, _ := json.Marshal(offersDto)
	w.Write(data)
}

func dispatch(w http.ResponseWriter, r *http.Request) {
	switch {
	case strings.HasPrefix(r.URL.Path, "/offer"):
		r.URL.Path = r.URL.Path[7:]
		getOffer(w, r)
	case strings.HasPrefix(r.URL.Path, "/image"):
		r.URL.Path = r.URL.Path[7:]
		getImage(w, r)
	}
}

func getOffer(w http.ResponseWriter, r *http.Request) {
	id, err := strconv.Atoi(r.URL.Path)
	if err != nil {
		http.Error(w, "No offer id", http.StatusBadRequest)
		return
	}
	offer, exist := offers[id]
	if !exist {
		http.Error(w, "No offer", http.StatusNotFound)
		return
	}
	data, _ := json.Marshal(offer)
	w.Write(data)
}

func getImage(w http.ResponseWriter, r *http.Request) {
	id, err := strconv.Atoi(r.URL.Path)
	if err != nil {
		http.Error(w, "No offer id", http.StatusBadRequest)
		return
	}
	_, exist := offers[id]
	if !exist {
		http.Error(w, "No offer", http.StatusNotFound)
		return
	}
	data, err := os.Open(fmt.Sprintf("images/img_%d.jpg", id))
	if err != nil {
		http.Error(w, "No image", http.StatusNotFound)
		return
	}
	defer data.Close()
	io.Copy(w, data)
}
