Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2D8F6C75
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2019 02:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfKKBsN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 10 Nov 2019 20:48:13 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:36331 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbfKKBsN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Nov 2019 20:48:13 -0500
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id xAB1lfOI017499;
        Mon, 11 Nov 2019 10:47:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com xAB1lfOI017499
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573436862;
        bh=WbMgIOtYDdMgY2/d3IuvIcnvLizbq0pCW8eDAZ+z/V4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=diTngbxIfddXhY00gmelzpcj+vztYcwyI8La863aBk04hqAdnHUmKZNWSLd7fYLPF
         PC1sxcYmHccYh9v68zFZacKRCM6Hy8vkXgg3Uq4sBY1JufQI/ChM2em2ayBHCv4TpX
         EgkJFHmhi68bAUDT1x0A8sRqNtC3VGyIPpPNcGZjW8wazzo8WsYbqzq1djFHwesPic
         IBgqDyUEV4gAaZrWCutpqFXNFm6iIM7uxQcFrpNfo4cSB+DEbs2SSmX+VCu48b3BQj
         OOU67AdKryxv7+MHXFVztSb3XL2OcPnTPLvydhFArDPGAqVO+TCldMUsbtahK+HEN0
         L9u9w1eEQR+gQ==
X-Nifty-SrcIP: [209.85.221.180]
Received: by mail-vk1-f180.google.com with SMTP id d10so2794969vke.3;
        Sun, 10 Nov 2019 17:47:41 -0800 (PST)
X-Gm-Message-State: APjAAAXWY8hHrZK2IA6wAB+myJGjDQeds1+PLKrXx6WT4kp0Jwqq7jsa
        tZpepWzKZXSKwdhn7swhXnDHAq78b1Yu8wc4xIw=
X-Google-Smtp-Source: APXvYqyNZWKa5fyzyyuiSEGDG6IQcCG/C1v7f4SYYRL4ByziZJnFAm6NzQx4ISGqHeD5S7yw6LvTW012Xq0/B7cITWU=
X-Received: by 2002:a1f:6a43:: with SMTP id f64mr16835572vkc.96.1573436860882;
 Sun, 10 Nov 2019 17:47:40 -0800 (PST)
MIME-Version: 1.0
References: <20191111011106.18427-1-linux@roeck-us.net> <20191110.173203.1243596361382467520.davem@davemloft.net>
In-Reply-To: <20191110.173203.1243596361382467520.davem@davemloft.net>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 11 Nov 2019 10:47:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQTCyEVKkJQfoTpd5USk5tibmcro6EeoonjXKm-OAFJ_g@mail.gmail.com>
Message-ID: <CAK7LNAQTCyEVKkJQfoTpd5USk5tibmcro6EeoonjXKm-OAFJ_g@mail.gmail.com>
Subject: Re: [PATCH] sparc: vdso: Fix build failure seen due to kbuild changes
To:     David Miller <davem@davemloft.net>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     sparclinux <sparclinux@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 11, 2019 at 10:32 AM David Miller <davem@davemloft.net> wrote:
>
> From: Guenter Roeck <linux@roeck-us.net>
> Date: Sun, 10 Nov 2019 17:11:06 -0800
>
> > sparc64:allmodconfig fails to build with the following error.
> >
> > unrecognized e_machine 18 arch/sparc/vdso/vdso32/vclock_gettime.o
> > arch/sparc/vdso/vdso32/vclock_gettime.o: failed
> > make[2]: *** [arch/sparc/vdso/vdso32/vclock_gettime.o] Error 1
> > make[2]: *** Deleting file 'arch/sparc/vdso/vdso32/vclock_gettime.o'
> > make[2]: *** Waiting for unfinished jobs....
> >
> > The problem bisects to commit a3de7a72c517 ("kbuild: change
> > *FLAGS_<basetarget>.o to take the path relative to $(obj)").
> > Duplicate the x86 specific defines from this commit to the sparc
> > vdso Makefile to fix the problem.
> >
> > Fixes: a3de7a72c517 ("kbuild: change *FLAGS_<basetarget>.o to take the path relative to $(obj)")
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>
> Acked-by: David S. Miller <davem@davemloft.net>


Yeah, I had submitted a fix a long time before.

https://lore.kernel.org/patchwork/patch/1130469/

I do not know why it was not picked up.


It is OK whether any patch is picked up
as long as the build error is fixed.


(I think  CFLAGS_REMOVE_vdso32/vdso-note.o
should be added too, though)




-- 
Best Regards
Masahiro Yamada
