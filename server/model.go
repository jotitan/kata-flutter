package main

type LightOfferDto struct {
	Id   int    `json:"id"`
	Name string `json:"name"`
}

type Offer struct {
	Id       int       `json:"id"`
	Name     string    `json:"name"`
	HasImage bool      `json:"image"`
	Products []Product `json:"products"`
}

func (o Offer) ToLightDto() LightOfferDto {
	return LightOfferDto{Id: o.Id, Name: o.Name}
}

type Product struct {
	Name     string  `json:"name"`
	Price    float32 `json:"price"`
	Quantity int     `json:"quantity"`
}
