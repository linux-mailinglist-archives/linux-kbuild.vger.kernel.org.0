Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66ECF69349
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2019 16:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732492AbfGOOnL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Jul 2019 10:43:11 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50778 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391753AbfGOOnK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jul 2019 10:43:10 -0400
Received: by mail-wm1-f67.google.com with SMTP id v15so15479887wml.0;
        Mon, 15 Jul 2019 07:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X/BMY7zzwOav0m72UIxct/q6KfFqA8uXilpppT8A16E=;
        b=FyNlaoh6KzGIfcneFIP0S8aPVZjlzGYNylLqlX2tUvlGGmTf7lyZS029GCvtGo8ENq
         ju4TUCvMFLdvwYlT/VRrY6srviBZopHL4DH8Eyld/n4OixSOwAE3TkKD9fBKYWJQ/Ggl
         6nVl/QcPsr9jVLaZhMwnfDVzVh41pwQm0aPgs2mFAJBacEj0xdqREUAdBSQaBqnKZoXg
         I7I42ahXjyiiWIWcR+7ev9OmmfFiHF+zz43hOqF27FqjtWODa3DqELNG7t4UV5yWzyC3
         KhbkCeG0swdVamt147KVH+6pInGKj2wMyLiwHynr1hjb3ZbE7zdNdvOTrjUCEp/2qRaa
         twQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X/BMY7zzwOav0m72UIxct/q6KfFqA8uXilpppT8A16E=;
        b=ABmdp04y9VVXQGvcARK/7NpLOlnk5x42IcfjJ4BoI+Y7hirguQKM1LTlIMcx62eu0K
         vVnb+H/qts+9AvjAV7vl7dBd8zsZlfaJzD0F/ak8n5TCN1zWfcZxy++pNMdGOFuJwp9x
         V1WhLPOq1bQKBMQPdYWX3FXve5okK6db86JwT2yXbd3qAoTqJhMyufi355KZKyWmrSr2
         QJ+Dy2uk2fKJtupvwUB2VidVBYHKpldYJKtMjgT78uhgGfhTXiELK9cXZYpxaN21ztbX
         gTuiyQb1EvDdGnlVo5QH5m80T8yKHwQAUjY0aCDLHlCBOu+T0Xih8w35BNFefXWn7jYI
         tNjw==
X-Gm-Message-State: APjAAAUPlAZLhpl6+DDwrfrDDDOFtP8zfSTfqC3MAwhlCjUKgSjRhSk9
        JoLFmkEB/he/ome38jArTLnAulTb
X-Google-Smtp-Source: APXvYqzSKyoVikQPwCxk8zlZVwWFm3fjsUNrV+8j4Zfhhz8UByhySKR4NSIed5Kfi+h866uogV6dTQ==
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr25765820wme.177.1563201788572;
        Mon, 15 Jul 2019 07:43:08 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
        by smtp.gmail.com with ESMTPSA id y16sm36938898wrg.85.2019.07.15.07.43.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 07:43:07 -0700 (PDT)
Date:   Mon, 15 Jul 2019 15:43:06 +0100
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Denis Efremov <efremov@linux.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] modpost: check for static EXPORT_SYMBOL* functions
Message-ID: <20190715144306.GA24120@arch-x1c3>
References: <20190714152817.24693-1-efremov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190714152817.24693-1-efremov@linux.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Denis,

On 2019/07/14, Denis Efremov wrote:
> This patch adds a check to warn about static EXPORT_SYMBOL* functions
> during the modpost. In most of the cases, a static symbol marked for
> exporting is an odd combination that should be fixed either by deleting
> the exporting mark or by removing the static attribute and adding the
> appropriate declaration to headers.
> 
> If this check will be considered useful, I will resend the patch with
> review fixes.
> 
> Currently, this check emits the warnings on the following symbols, most
> of which are accepted to be fixed:
> 1. "sas_wait_eh" [drivers/scsi/libsas/libsas]
>    Patch: https://lkml.org/lkml/2019/7/8/970 (accepted)
> 2. "torture_onoff_cleanup" [kernel/torture]
>    "torture_shuffle_cleanup" [kernel/torture]
>    Patch: https://lkml.org/lkml/2019/7/4/411 (accepted)
> 3. "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress]
>    Patch: https://lkml.org/lkml/2019/7/8/842
> 4. "drm_client_close" [drivers/gpu/drm/drm]
>    Patch: https://lkml.org/lkml/2019/7/3/758 (accepted)
> 5. "gve_probe" [drivers/net/ethernet/google/gve/gve]
>    Patch: https://lkml.org/lkml/2019/7/14/65
> 6. "i2c_new_client_device" [vmlinux]
>    "i2c_new_dummy_device" [vmlinux]
>    Patch: https://lkml.org/lkml/2019/7/7/226 (fixed in a different patch)
> 7. "ahci_em_messages" [drivers/ata/libahci]
>    Patch: https://lkml.org/lkml/2019/7/10/550 (reviwed)
> 8. "ftrace_set_clr_event" [vmlinux]
>    Patch: https://lkml.org/lkml/2019/7/4/609 (reviwed)
> 9. "rmi_2d_sensor_set_input_params" [drivers/input/rmi4/rmi_core]
>    Patch: https://lkml.org/lkml/2019/7/8/999
> 10. "empty_zero_page" [vmlinux]
> 11. "phys_base" [vmlinux]
> 12. "hypercall_page" [vmlinux]
> 
> Similar commits:
> 1. 54638c6eaf44 ("net: phy: make exported variables non-static")
> 2. 98ef2046f28b ("mm: remove the exporting of totalram_pages")
> 3. 73df167c819e ("s390/zcrypt: remove the exporting of ap_query_configuration")
> 4. a57caf8c527f ("sunrpc/cache: remove the exporting of cache_seq_next")
> 5. e4e4730698c9 ("crypto: skcipher - remove the exporting of skcipher_walk_next")
> 
> Build time impact, allmodconfig, Dell XPS 15 9570 (measurements 3x):
> $ make mrproper; make allmodconfig; time make -j12; \
>   git checkout HEAD~1; \
>   make mrproper; make allmodconfig; time make -j12
> 1.
>    (with patch) 17635,94s user 1895,54s system 1085% cpu 29:59,22 total
>    (w/o  patch) 17275,42s user 1803,87s system 1112% cpu 28:35,66 total
> 2.
>    (with patch) 17369,51s user 1763,28s system 1111% cpu 28:41,47 total
>    (w/o  patch) 16880,50s user 1670,93s system 1113% cpu 27:46,56 total
> 3.
>    (with patch) 17937,88s user 1842,53s system 1109% cpu 29:42,26 total
>    (w/o  patch) 17267,55s user 1725,09s system 1111% cpu 28:28,17 total
> 
> Thus, the current implementation adds approx. 1 min for allmodconfig.
> However, it's possible to do the check in a more optimal way if it will
> be considered useful.
> 
> Also, this kind of check could be implemented as a separate script instead.
> Here is the implementation:
> https://gist.github.com/evdenis/bf2322d094f0c02c0f60fe0a225848b2
> 

Personally I think this is a pretty good feature.

If I did my numbers correctly, the above numbers show ~2% increase.
Although one should be able to reduce that if people feel too strongly.

That said, the patch is:
Acked-by: Emil Velikov <emil.l.velikov@gmail.com>

Can we make sure that patches for all issues are out (on the respective
mailing lists, or merged) before this lands.


HTH
Emil
