package main

import "fmt"

type AppService struct{}

func (a *AppService) Greet(name string) string {
	return fmt.Sprintf("Hello %s, It's show time!", name)
}

func (a *AppService) LogPrintln(log string) (len int) {
	len, _ = fmt.Println(log)
	return len
}

func (a *AppService) IsFrameless() bool {
	return isFrameless
}
