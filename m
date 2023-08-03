Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 342E576E559
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Aug 2023 12:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235365AbjHCKQa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Aug 2023 06:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235315AbjHCKPz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Aug 2023 06:15:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A1B4493
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Aug 2023 03:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691057680;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nbDG2XLgsFKEHrq3JdTfOdsEgiqhe9GVbea4Q7TpxDw=;
        b=cOVqo6WHwe65UBlQmWfvnUVFxrEbuR+LTfGUy9X/TMMwn4rO8HDaBBRpIZxsP594Ak/Jny
        e076Vl/T7rg7eMuHuIxAXavOZS5eIHolhU33t6WvaJwopmzEHl6CdvqBuOj++6jAztFcOf
        /+gxnrqFBW4vZgn9CtxvnEISX9rOsng=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-hPHJ6rclOiW8tsPVMXzBMw-1; Thu, 03 Aug 2023 06:14:39 -0400
X-MC-Unique: hPHJ6rclOiW8tsPVMXzBMw-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-63cf9d48006so8867136d6.1
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Aug 2023 03:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691057678; x=1691662478;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbDG2XLgsFKEHrq3JdTfOdsEgiqhe9GVbea4Q7TpxDw=;
        b=WYLGeNr//TgQuwLCurY1LiI53U669PKenYKMl3pGDAOrNsh9tW/I7JbCkIy19OuBnC
         TAsazuIoYEqXvGUh3a4IddfAoqUuvnjG2oJPnSXbDshA1gNAUiFGRBpQNwswEgp0VZfn
         /j3Ryefmuj+3Xr6LGeWXlgqYSuHh0ZgCJPMvG2pNQHUukNRjW3dYQQy7KBulyDhF64Ra
         1C3eifkcX8vZ/GKGGJ1k++YWvp1OjUpoe//1Sv8zHZjPkL8ouLJMYZQyiWaeikAJFCrG
         BSQJzCrWUshLwRnZZdADxnngAahXHY9r5Y4g4Om7zQX3kx9MY3xFrkjJuPHugygj/W41
         8ZHA==
X-Gm-Message-State: ABy/qLbYKjb9r9V23Wis4tGMWU9O6zv5GzWsDDVZRixSq3pLRXoAfpA0
        OHASbMl/k9ykhGCQX2nTX+6DW1HiRFXG6ur0mKLrygEVZaQFDNVNFfyiTcfQg7ErqlN3xN892XX
        qADYaBGKiONoJTg6VIhQqysTHmpRimSK0
X-Received: by 2002:a05:622a:302:b0:403:ae9e:2a6d with SMTP id q2-20020a05622a030200b00403ae9e2a6dmr27780966qtw.43.1691057678193;
        Thu, 03 Aug 2023 03:14:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGKX5dQObhExOhtEMNJ2gYmlrfS6JE+5CLYIjzbNPAGvPIi5bQuZXDpfCcp9FZFRaqTM4SH4A==
X-Received: by 2002:a05:622a:302:b0:403:ae9e:2a6d with SMTP id q2-20020a05622a030200b00403ae9e2a6dmr27780951qtw.43.1691057677952;
        Thu, 03 Aug 2023 03:14:37 -0700 (PDT)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id n2-20020ac81e02000000b00403f0e47dd6sm6093367qtl.67.2023.08.03.03.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 03:14:37 -0700 (PDT)
Date:   Thu, 3 Aug 2023 06:14:36 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] scripts: add kconfig lookup script
Message-ID: <ZMt+DGRQIZ52miGF@brian-x1>
References: <20230801174922.333700-1-bmasney@redhat.com>
 <20230801174922.333700-3-bmasney@redhat.com>
 <CAK7LNAQ-nhy1_xFYiwuvOKvfUVSjvnEb4ZnJ8EMWo7uJun89Zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQ-nhy1_xFYiwuvOKvfUVSjvnEb4ZnJ8EMWo7uJun89Zg@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 03, 2023 at 03:23:16PM +0900, Masahiro Yamada wrote:
> Everyone tends to have their own utility scripts
> on their machines.
> 
> I think this patch set falls into that category
> as "create a wrapper script of grep" is what everyone
> does to reduce typing.
> 
> 
> 
> 
> FWIW, I have the following scripts in my ~/bin directory.
> 
> 
> 
> $ cat ~/bin/kgrep
> #!/bin/sh
> 
> exec find . -name .repo -prune -o -name .git -prune -o -type f \
> \( -name 'Kconfig*' -o -name 'Config.in' \) \
> -print0 | xargs -0 grep --color -n "$@"
> 
> 
> $ cat ~/bin/mgrep
> #!/bin/sh
> 
> exec find . -name .repo -prune -o -name .git -prune -o -type f \
> \( -name 'Makefile*' -o -name 'Kbuild*' -o -name "*.mk" \) \
> -print0 | xargs -0 grep --color -n "$@"
> 
> 
> 
> 
> masahiro@zoe:~/ref/linux(master)$ kgrep -A5 TSL2772
> ./drivers/iio/light/Kconfig:564:config TSL2772
> ./drivers/iio/light/Kconfig-565- tristate "TAOS TSL/TMD2x71 and
> TSL/TMD2x72 Family of light and proximity sensors"
> ./drivers/iio/light/Kconfig-566- depends on I2C
> ./drivers/iio/light/Kconfig-567- help
> ./drivers/iio/light/Kconfig-568-   Support for: tsl2571, tsl2671,
> tmd2671, tsl2771, tmd2771, tsl2572, tsl2672,
> ./drivers/iio/light/Kconfig-569-   tmd2672, tsl2772, tmd2772 devices.
> 
> masahiro@zoe:~/ref/linux(master)$ mgrep efivarfs.o
> ./fs/efivarfs/Makefile:6:obj-$(CONFIG_EFIVAR_FS) += efivarfs.o
> ./fs/efivarfs/Makefile:8:efivarfs-objs := inode.o file.o super.o vars.o
> 
> 
> 
> That's my local way to satisfy my demand.
> I do not intend to force my way or merge it in the upstream.

OK, fair enough.

Those are useful little utilities and simpler than what I posted. If
something like these had been in the scripts/ directory, then I
wouldn't have spent the time to write yet another script that does
basically the same thing. I get what you are saying, however having
a script to lookup a Kconfig by name or module will be useful to other
people.

Brian

