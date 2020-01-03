Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5092912F3D4
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2020 05:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbgACEUz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Jan 2020 23:20:55 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:38571 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbgACEUz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Jan 2020 23:20:55 -0500
Received: by mail-qk1-f195.google.com with SMTP id k6so32945310qki.5;
        Thu, 02 Jan 2020 20:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Lv7PeBfUGXL6vtm90dmNt6FN76fZ70+66Xw8HFNdMxo=;
        b=LAoHZH9eBKCd9UdPpMg+RbC+bqsNDeep0xr71Y0UgWOB8EgRFZcRnRzBYFba9ItOCN
         GUyIgMDugE3SsZQJFZmEh5b2PDAz025s69uOc1eBsqiFsDzygaoKKGIj/jpiKwbPtZLO
         s0AG5bvBL8Q2j3QtqSw6x0oRJKofQulfLcftd8iq12Pk/G0Q2yWtmg5b8v6a50jiPre3
         ASyd+ZkbAm3BD/KcWTe42ZbCGrGY1BgT2nfxLs6kKQNWlQUKLgXe7i4LgWt/RntnYeSN
         JSbRB4/AYP7sHmcbjyXRALA18fYwXRqAq0sw6jOFhU8WOysOV8axQ9/99XjMdY1b1ZFc
         o8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Lv7PeBfUGXL6vtm90dmNt6FN76fZ70+66Xw8HFNdMxo=;
        b=Nwipfa/5z5EBorl9cH8x7O9mHkH3p4TLZOYC50+FmFUWgo5J2fTl1vbZNqGolq5IOK
         n5OkXT6gRXSY3fponFjKUu7Hy+VQIQnouKVTCpULZwwc+lvcIKkHqyhvcnflpemGL1Kj
         p6gMmfzjMfIcroQlv4Fx1R9+MSCCgbyy7eRV8XyWqpaNiVzL617BLATxDXlbQj+QOzPG
         5qVWtGMTNcm+Gc7x73AbO86AOhXEYJASmkpfZGr7IbSG3/ExfIRfGH2w6wsAa1Q+JIxr
         RmdUjs5d7BzNovnTSm53PzAMuN+k0McXmYkgb3CrNAfQT0oTaniqTQpRFFn3ntmIplJ7
         7QvQ==
X-Gm-Message-State: APjAAAXTVJz6R5Kct5XVTJ47aeBZeX+jXHpflRATxl9xVQVXf2xKt0+W
        Ea/0Ow5DyHzE4dDmbAyB1Zk=
X-Google-Smtp-Source: APXvYqy7fzp//OI9b3qRPWsxN5Q5aixZIjMW17IffbdAaoKVBtjoSrwNmTgTHr+XQFmVLIkwJedgUg==
X-Received: by 2002:a37:6794:: with SMTP id b142mr70491596qkc.216.1578025254596;
        Thu, 02 Jan 2020 20:20:54 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id b81sm15748908qkc.135.2020.01.02.20.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 20:20:54 -0800 (PST)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Thu, 2 Jan 2020 23:20:52 -0500
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Rob Landley <rob@landley.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kconfig: restore prompt dependencies in help text
Message-ID: <20200103042052.GA1113792@rani.riverdale.lan>
References: <0ea3e528-4835-ff9c-f5a2-f711666ba75f@infradead.org>
 <20200102231402.1052657-1-nivedita@alum.mit.edu>
 <CAK7LNAQrD4wcjqFTendbBGA2TXkbmxccRbv31HBCXz+J82w47g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAQrD4wcjqFTendbBGA2TXkbmxccRbv31HBCXz+J82w47g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 03, 2020 at 11:10:28AM +0900, Masahiro Yamada wrote:
> 
> I had already applied the following patch;
> https://patchwork.kernel.org/patch/11298143/
> 
> It it available in linux-next.
> 

Oh cool
