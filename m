Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 044D625979C
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Sep 2020 18:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730724AbgIAQQW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Sep 2020 12:16:22 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:51229 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728275AbgIAPeU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Sep 2020 11:34:20 -0400
Received: by mail-pj1-f66.google.com with SMTP id ds1so806083pjb.1;
        Tue, 01 Sep 2020 08:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=i38RE50+o+7Xi/V63EnQit0knXFO0KJ4UL6nDtZEEQk=;
        b=YkvHt5TI0bIBIsQ3ZTD3opgXy+Qf3qOooRXxIuTuanNaGdyJppaXuCRpn2r42lU6MM
         PNx/pSftiqiU1NYvT1udUU+r0SIXvhSKOLTxe+qyuX/M8NULvsXpFlb1/PfCP2hIBKc+
         mklt9EezQJ4aNmFPWb7lWIDafWhl3NTccTB3BHx17gfaBjpf7FdFpOTw2VxnSZRTm6Z8
         pY/kFsdNY5hd702SofvYBQ2no6YNICuJR087soW/hM+32qOCEhBIWDZXoUiAHSCAqJLu
         7/H7+0kpjPtTiSMl6h1nfRVSJqXZI67ww/viLJqmctBnU07pLD36kYuLQ9k7ZlMDJeXd
         90+g==
X-Gm-Message-State: AOAM5331TLHsPNyf+Hpp221MeurcD7Zw7piv7bjf1ex3zTkfGF1hgTid
        8tmmbUtpmADpl25Wed91iOSIPzvgPAE=
X-Google-Smtp-Source: ABdhPJyvs4WVpd10KSuRKdfbQOMaxQxGZ/9QR5e8uOVAmfHd8e/2ltBv0qN+Izrqj7NFH7th+Ivydw==
X-Received: by 2002:a17:90a:c28e:: with SMTP id f14mr2084142pjt.83.1598974459739;
        Tue, 01 Sep 2020 08:34:19 -0700 (PDT)
Received: from [192.168.3.218] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id g17sm2915153pge.9.2020.09.01.08.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 08:34:18 -0700 (PDT)
Subject: Re: [PATCH 0/1] block io layer filters api
To:     Sergei Shtepa <sergei.shtepa@veeam.com>,
        Jens Axboe <axboe@kernel.dk>
Cc:     "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "koct9i@gmail.com" <koct9i@gmail.com>,
        "jack@suse.cz" <jack@suse.cz>,
        "damien.lemoal@wdc.com" <damien.lemoal@wdc.com>,
        "ming.lei@redhat.com" <ming.lei@redhat.com>,
        "steve@sk2.org" <steve@sk2.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
References: <1598555619-14792-1-git-send-email-sergei.shtepa@veeam.com>
 <7a517822-6be2-7d0d-fae3-31472c85f543@kernel.dk>
 <20200901132957.GA18251@veeam.com>
From:   Bart Van Assche <bvanassche@acm.org>
Autocrypt: addr=bvanassche@acm.org; prefer-encrypt=mutual; keydata=
 mQENBFSOu4oBCADcRWxVUvkkvRmmwTwIjIJvZOu6wNm+dz5AF4z0FHW2KNZL3oheO3P8UZWr
 LQOrCfRcK8e/sIs2Y2D3Lg/SL7qqbMehGEYcJptu6mKkywBfoYbtBkVoJ/jQsi2H0vBiiCOy
 fmxMHIPcYxaJdXxrOG2UO4B60Y/BzE6OrPDT44w4cZA9DH5xialliWU447Bts8TJNa3lZKS1
 AvW1ZklbvJfAJJAwzDih35LxU2fcWbmhPa7EO2DCv/LM1B10GBB/oQB5kvlq4aA2PSIWkqz4
 3SI5kCPSsygD6wKnbRsvNn2mIACva6VHdm62A7xel5dJRfpQjXj2snd1F/YNoNc66UUTABEB
 AAG0JEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPokBOQQTAQIAIwUCVI67
 igIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFcPTXFzhAJ8QkH/1AdXblKL65M
 Y1Zk1bYKnkAb4a98LxCPm/pJBilvci6boefwlBDZ2NZuuYWYgyrehMB5H+q+Kq4P0IBbTqTa
 jTPAANn62A6jwJ0FnCn6YaM9TZQjM1F7LoDX3v+oAkaoXuq0dQ4hnxQNu792bi6QyVdZUvKc
 macVFVgfK9n04mL7RzjO3f+X4midKt/s+G+IPr4DGlrq+WH27eDbpUR3aYRk8EgbgGKvQFdD
 CEBFJi+5ZKOArmJVBSk21RHDpqyz6Vit3rjep7c1SN8s7NhVi9cjkKmMDM7KYhXkWc10lKx2
 RTkFI30rkDm4U+JpdAd2+tP3tjGf9AyGGinpzE2XY1K5AQ0EVI67igEIAKiSyd0nECrgz+H5
 PcFDGYQpGDMTl8MOPCKw/F3diXPuj2eql4xSbAdbUCJzk2ETif5s3twT2ER8cUTEVOaCEUY3
 eOiaFgQ+nGLx4BXqqGewikPJCe+UBjFnH1m2/IFn4T9jPZkV8xlkKmDUqMK5EV9n3eQLkn5g
 lco+FepTtmbkSCCjd91EfThVbNYpVQ5ZjdBCXN66CKyJDMJ85HVr5rmXG/nqriTh6cv1l1Js
 T7AFvvPjUPknS6d+BETMhTkbGzoyS+sywEsQAgA+BMCxBH4LvUmHYhpS+W6CiZ3ZMxjO8Hgc
 ++w1mLeRUvda3i4/U8wDT3SWuHcB3DWlcppECLkAEQEAAYkBHwQYAQIACQUCVI67igIbDAAK
 CRBxXD01xc4QCZ4dB/0QrnEasxjM0PGeXK5hcZMT9Eo998alUfn5XU0RQDYdwp6/kMEXMdmT
 oH0F0xB3SQ8WVSXA9rrc4EBvZruWQ+5/zjVrhhfUAx12CzL4oQ9Ro2k45daYaonKTANYG22y
 //x8dLe2Fv1By4SKGhmzwH87uXxbTJAUxiWIi1np0z3/RDnoVyfmfbbL1DY7zf2hYXLLzsJR
 mSsED/1nlJ9Oq5fALdNEPgDyPUerqHxcmIub+pF0AzJoYHK5punqpqfGmqPbjxrJLPJfHVKy
 goMj5DlBMoYqEgpbwdUYkH6QdizJJCur4icy8GUNbisFYABeoJ91pnD4IGei3MTdvINSZI5e
Message-ID: <b99a1577-6f39-9228-d176-5a8bc38bd64d@acm.org>
Date:   Tue, 1 Sep 2020 08:34:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200901132957.GA18251@veeam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2020-09-01 06:29, Sergei Shtepa wrote:
> However, the same time requirement also presents a big immediate problem -
> as until this is done, over a hundred thousands of Linux users will not be
> able to protect their servers running the impacted kernels
> (our backup agent is free).
> They will be forced to stop using the new version of the kernel
> (or take a risk of data loss).

How can backup software work at the block layer level without any cooperation
of higher layers? How is it e.g. guaranteed that backups are crash-consistent?

What happens if the network connection with the backup server is lost? How
much time is needed to recover after the network connection has been restored?
Does the contents of the entire block device has to be resent to the backup
server?

Thanks,

Bart.
