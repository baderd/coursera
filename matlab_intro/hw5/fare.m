function fare_dollars = fare(traveldist, age)
    if traveldist >0 && traveldist <1
        traveldist=1;
    end
    
    traveldist = round(traveldist);
    if traveldist <= 10
        fare_dollars = 2 + (traveldist-1)*0.25;
    else
        fare_dollars = 2 + 9*0.25 + (traveldist-10)*0.1;
    end
    
    if age <= 18 || age>=60
        fare_dollars = fare_dollars * 0.8;
    end
end
