Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C88AC12AB3A
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Dec 2019 10:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfLZJ0F (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Dec 2019 04:26:05 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:63699 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfLZJ0E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Dec 2019 04:26:04 -0500
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id xBQ9Pmps017029;
        Thu, 26 Dec 2019 18:25:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com xBQ9Pmps017029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1577352349;
        bh=868LF5fNBXon+/YosLXXxXjPrjEeuTbjvxkdaXVg3Co=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fC1URGiluF5mlCioABfUtftvhc+bJ9u4V0PsXm6trRS0vDmGblenFFChJAoZ0Woau
         sBN8aZnfmCz+eYgu/G4SB2/d3UexJXeMLTXWmZDLNKFx7c/1uUKBKyTXv+eIbsiOio
         1ah3aUyrMkA4k9MUF9IqoiMF6FhaBzttEO3aOe4gkInIrm7UYIX5sqFlnwXo+juDUs
         EUcSJd5GLm9y1PT6XwE9qI8+QPIZcF+ZfD5CHnxah54s1EeP6bO+k2KC1IAI1oZrbA
         2/wvsWYndh7E3v4Rnhx0UFac1YFTQTpfo7GeMDqvkNEqncgotN+PJTfqDdSlPFV4D7
         FEhmeVWh82DHQ==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id l6so7943205uap.13;
        Thu, 26 Dec 2019 01:25:49 -0800 (PST)
X-Gm-Message-State: APjAAAUutp03WaH1X9ekGXpbpHrgf6wDTLBBg+K4Ipmfo/4wVWtd9XhT
        xac6+oSnNQ0uUlATGFkCK4Ls2cAZWPxUFmf0Kj4=
X-Google-Smtp-Source: APXvYqz0nxjWQitx7QkPZHc72SdzkOWCKHkNjPH4uzJ7hLCNMenchXdd06VG3c71nSE+uiSxMyqQTpPicv26w+pbO7g=
X-Received: by 2002:ab0:63c7:: with SMTP id i7mr24728717uap.109.1577352348035;
 Thu, 26 Dec 2019 01:25:48 -0800 (PST)
MIME-Version: 1.0
References: <1577253483-24358-1-git-send-email-fanliangcai9@gmail.com>
In-Reply-To: <1577253483-24358-1-git-send-email-fanliangcai9@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 26 Dec 2019 18:25:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS7Jj0=abxAH4K41BkBfrOLjygBo0KvXyVUO2b240bCww@mail.gmail.com>
Message-ID: <CAK7LNAS7Jj0=abxAH4K41BkBfrOLjygBo0KvXyVUO2b240bCww@mail.gmail.com>
Subject: Re: [PATCH] use bash instead of sh to run mkcompile_h
To:     Liangcai Fan <fanliangcai9@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        zhang.lyra@gmail.com, gengcixi@gmail.com, orson.zhai@unisoc.com,
        Liangcai Fan <liangcai.fan@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 25, 2019 at 2:58 PM Liangcai Fan <fanliangcai9@gmail.com> wrote:
>
> From: Liangcai Fan <liangcai.fan@unisoc.com>
>
> Use sh to run mkcompile_h, compilation would fail if whoami contains
> backslash, since sh uses dash. The reason is that the echo command would
> interpret backslash to escapes, so the LINUX_COMPILE_BY definition was
> incorrect.
>
> Parse mkcompile_h with bash, the echo command would not see backslash as
> escapes, then there is no error with the definition of LINUX_COMPILE_BY.
>
> Signed-off-by: Liangcai Fan <liangcai.fan@unisoc.com>
> Signed-off-by: Liangcai Fan <fanliangcai9@gmail.com>
> ---

This problem was fixed by
commit c8f3dea90e38194dae542c5d56e05d30447e58cb



-- 
Best Regards
Masahiro Yamada
