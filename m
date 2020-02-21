Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 385631685C1
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2020 18:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgBUR7X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Feb 2020 12:59:23 -0500
Received: from mail-yb1-f196.google.com ([209.85.219.196]:40266 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgBUR7X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 12:59:23 -0500
Received: by mail-yb1-f196.google.com with SMTP id f130so1506447ybc.7;
        Fri, 21 Feb 2020 09:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d+3XR2+xUaDuja2XE/EGJWyGmU2O7nDCNT8Z/xea85c=;
        b=F1AUvinjYNfKfJKmXNWxwf0qr/7noCmBuxd9yZTjj2p7M1gaQ3dR09hEZsxJB7oz+n
         wDpUcwKkBOzTX0ccVFa7tb0ZRA7ktCQ3Hmi5t178srD5vt1Ct6jfy9wcqMzP4wyC35Vj
         pOY0BDk1zA1qPMKpppHGQDT/cuLhfjpU25EdjauYXmBm+1o0xdmkWNVX8v1+vuY4aaQX
         fHgMlwAzb30PlGG6v+AoaqhtjeNxl41K+pSho98x7pRypPCNpYfk2JtiMuHNZsSRouvC
         3/vY3RH4DfDQzxdPkuFlQMm80mKjZ18gzEe1eDLmw74JFhqZn9pkYnV3adwtACApxxh5
         j4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d+3XR2+xUaDuja2XE/EGJWyGmU2O7nDCNT8Z/xea85c=;
        b=TA34qpeBYjTdqt0Ws62QgdXGWdq/twOstNHFnyQKRNFMkBjdvxMP4X7b+XPL5niHwR
         qvuNckE8Lhk5BVhXhN7hXZErUpg0mBQuIpXbTeJKLASDIrZJuFcJOUJfXBW2TRUu6Frk
         Yglrds//WvpFLfVF/OxJhwC3UxWn3+G4xqTFUkHNrwWtPG1tL1GOR+hgdIaUAUoxOfkC
         blXSTR7ytz1wZhDZxMAW9otYlckfdEf6PLodLLLUx2wr8kHJuZGW7Cisj9aCihCjPfJC
         oatsUBi3hTmX+FyabXK/wN5KVjs+4ltI11SezaqJI+8c8jqAvhsurXVKOIte7CLkoNs4
         uBVA==
X-Gm-Message-State: APjAAAWxfTarJVk5QJt/MUjnWzR0XOXkNNrKlmykWho41wHYnHQ4ug9n
        gJ1xran1y8mRhSw//vt+hLY=
X-Google-Smtp-Source: APXvYqyRDEFYbQ44GKGTATKL9Tar5xfkSf51uMM1OQQ7v9ZzK60KhXCNbvIegj2noZq04+lADokbRQ==
X-Received: by 2002:a25:8041:: with SMTP id a1mr35923492ybn.420.1582307962089;
        Fri, 21 Feb 2020 09:59:22 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id e131sm1424259ywb.81.2020.02.21.09.59.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Feb 2020 09:59:21 -0800 (PST)
Subject: Re: [RFC PATCH v2 4/4] script: make automatic dtb build info
 generation
To:     Alexandre Torgue <alexandre.torgue@st.com>, robh+dt@kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        david@gibson.dropbear.id.au, sjg@chromium.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org,
        Ian Lepore <ian@freebsd.org>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
 <20200221161418.20225-5-alexandre.torgue@st.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <cdeab1e4-9220-2f08-575d-15309caed14d@gmail.com>
Date:   Fri, 21 Feb 2020 11:59:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200221161418.20225-5-alexandre.torgue@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2/21/20 10:14 AM, Alexandre Torgue wrote:
> Append each "xxx.dtb.dts.tmp" file with "build-info" entry during dtb
> build. It allows to get build information (date, source version, ...)
> for each device tree without modify them manually.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index a5af84ef4ffc..f084e78267b2 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -289,6 +289,7 @@ quiet_cmd_dtc = DTC     $@
>  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
>  	$(DTB_GEN_INFO) $(src) ; \
>  	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> +	$(DTB_GEN_INFO) $(src) $(dtc-tmp) ; \
>  	$(DTC) -O $(2) -o $@ -b 0 \
>  		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>  		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
> diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info.sh
> index 0cd8bd98e410..72f31e386787 100755
> --- a/scripts/gen_dtb_build_info.sh
> +++ b/scripts/gen_dtb_build_info.sh
> @@ -6,5 +6,7 @@ set -o nounset
>  DTB_DIR=$1
>  DTB_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
>  DTB_INFO="From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\0"
> +DTS_FILE=$2
>  
> -printf "$DTB_INFO" > "$DTB_DIR/dtb-build.txt"
> +printf "$DTB_INFO" > "arch/arm/boot/dts/dtb-build.txt"
> +echo "&{/} {build-info = /incbin/(\"dtb-build.txt\");};" >> $DTS_FILE
> 

Whatever the correct version of this ends up being, it should be
implemented as a single patch instead of patch 1/4 being modified
by patch 4/4.

