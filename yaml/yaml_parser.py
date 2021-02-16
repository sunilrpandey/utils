import yaml
import json

def demo():
    filename = "sample.yaml"
    #yaml.load()
    with open(filename) as ymlfile:
        print("File Content..")
        sample = yaml.load(ymlfile, Loader=yaml.FullLoader)
        #print(sample)
        
        print("Demo : List..")
        lst = sample['lst']
        print(lst)

        print("Demo : Dictionary..")
        d = sample['dct']
        for k,v in d.items():
            print("{}-{}".format(k,v))
        
        print("Demo : Nested List..")
        lst = sample['nested_list']
        print(lst)

        print("Demo : Nested Dict..")
        d = sample['nested_dct']
        print(json.dumps(d,indent=4))
        
        print("Demo : Dictionary in list..")
        lst = sample['dict_in_list']
        print("Complete list : ", lst)
        d = lst[0]
        print("Fetched dictionary : ",json.dumps(d,indent=4))
        
        print("Demo : List in dictionary..")
        d = sample['list_in_dict']
        print("Complete Dictionary : ", d)
        lst = d['key2']
        print("Fetched List : ",lst)
       
if __name__ == "__main__":
    demo()