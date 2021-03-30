Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64A234E088
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Mar 2021 07:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbhC3FGg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Mar 2021 01:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhC3FGc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Mar 2021 01:06:32 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F30C061764
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Mar 2021 22:06:32 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id v10so5986814pfn.5
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Mar 2021 22:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=0fxf1pqArnRlwV/UXS2GCx4oBLa7c/szr4cwgrzePoI=;
        b=jIuKZHa7oZIGY8lzBAj9I5ffuXlznNjKZjiIn9eEJjMGwSRXlQP8gDL+5W+8Z0tfvg
         flmVGbIzjY+frOIEgJOdTYJ+rxyRcq/ESbrCfrPsj4QSvkEukLgadJBGL6QSrSbMCLqZ
         LmEPM7PKe82E4FZffxN3ChnwER0El8dHHIyQbHzDukPLZKmTR5ZLmMhc5ZO7R/P4TOVZ
         Ow9u+w5Hq929+JP02SREQpdsJakFcViOLRl2dQmvwxXhE3WO0nbew4kZJLgcazZ9VRYl
         Vx/CLCMtf2tDVRsDQpI7ZwPhjyeCEvZHrzPkMGa5iAW9+R2VHd3QlsmDyZER+HG76ES1
         /phQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=0fxf1pqArnRlwV/UXS2GCx4oBLa7c/szr4cwgrzePoI=;
        b=I5/3i2CJQ8CY1ZMFUbFNhBBBnpCQHAs2CIM1WLKWzzUz5r9JUWpNJjwlhMC3d/Wc+K
         ZF3e1ZJYPd1O/0V+FiMJ4AYbJ5xohHdUn59pnkLb88ahYFKVV50oGH7+G+1jrJVURdIk
         hW81xqGDnXXS4sSjys74eDGtfRS6TbKXN2y8llZy5lK33z4S3kEIWM+0eDJzlIA8wVTH
         8p4bdSVEF7lnhT5d+H2CLmFfqnPG6+d7xjmermF06Seotrg4ZNeitiTej0nWv1tcLd+F
         mUCO2oSAOsNmeW/2ZVLwLSzsoxiJULIwC/hM0rHGhaHonMjH4BSi9vNHLg2qMI5eWxtZ
         7qTg==
X-Gm-Message-State: AOAM530G5YTU0wtf+T/UBH9YnK2fI+W6hNf6AlimigPtKhFTCyY4qxy1
        zzgZrZ6AzGiZpCq9MXo6yjhIbw==
X-Google-Smtp-Source: ABdhPJzswVyCCiZPCQPJRXrQwpsQvzoUWDBpaMvczfG7dW1Gqx15K3sybIOlB5eg36GHmbejYHxJ/g==
X-Received: by 2002:a63:4460:: with SMTP id t32mr26348816pgk.139.1617080791906;
        Mon, 29 Mar 2021 22:06:31 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id fh19sm1390377pjb.33.2021.03.29.22.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 22:06:31 -0700 (PDT)
Date:   Mon, 29 Mar 2021 22:06:31 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Mar 2021 22:01:15 PDT (-0700)
Subject:     Re: [PATCH] kbuild: buildtar: add riscv support
In-Reply-To: <20210316160242.61712-1-me@carlosedp.com>
CC:     david.abdurachmanov@sifive.com, me@carlosedp.com,
        masahiroy@kernel.org, michal.lkml@markovi.net,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     me@carlosedp.com
Message-ID: <mhng-6e97a94b-b3a1-4bdb-aa0b-30f44ec3d2fb@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 16 Mar 2021 09:02:43 PDT (-0700), me@carlosedp.com wrote:
> Make 'make tar-pkg' and 'tarbz2-pkg' work on riscv.
>
> Signed-off-by: Carlos de Paula <me@carlosedp.com>
> ---
>  scripts/package/buildtar | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index 936198a90477..221aa7df008d 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -123,10 +123,18 @@ case "${ARCH}" in
>  				cp -v -- "${objtree}/arch/arm64/boot/${i}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
>  				break
>  			fi
>  		done
>  		;;
> +	riscv)
> +		for i in Image.bz2 Image.gz Image; do
> +			if [ -f "${objtree}/arch/riscv/boot/${i}" ] ; then
> +				cp -v -- "${objtree}/arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
> +				break
> +			fi
> +		done
> +		;;
>  	*)
>  		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
>  		echo "" >&2
>  		echo '** ** **  WARNING  ** ** **' >&2
>  		echo "" >&2

Thanks, this is on for-next.
