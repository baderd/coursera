function [nseg, npoles] = fence(fencel, segl)
    nseg = ceil(fencel/segl);
    npoles = nseg +1;
end