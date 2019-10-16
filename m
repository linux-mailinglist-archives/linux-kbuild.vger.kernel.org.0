Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94902DA1FA
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2019 01:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389167AbfJPXLV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Oct 2019 19:11:21 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46059 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfJPXLV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Oct 2019 19:11:21 -0400
Received: by mail-lf1-f65.google.com with SMTP id a19so245972lfg.12
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Oct 2019 16:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eGKtZ/zw77SVmwWAmi2W2qbaG2CuisyYfyjtCue+A+4=;
        b=J+x43ZuuP6oW4LgSz5GgRglUir/a9W55AO5TScArhufGqXsk5DSUW4YQVGd9WWaAbf
         8YsfrLhxL4LKnbZbP2hAUFQqgixvndPoglPW3Tv3yJ6FyVg39EKhskSE0ZDlPZMgot2f
         b3oPE2GyepAnrz8h0ibhFpnkS3t9VCOSghlaFfChToxS21Z/sEpqm6/fF45jqgB/UrTC
         kQwI3Dgm2CHfO9MpivkTFkuXXeu0DpSjm8GpLDozi7AdT9EJK8omewSJxqO7b6Bt1cUa
         E8eQzcsDRdXKm2iqmR7ythG63YgnjErg5pjMe968m8LHncu2vlsmj0LDDcAECBK7UZYI
         y1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eGKtZ/zw77SVmwWAmi2W2qbaG2CuisyYfyjtCue+A+4=;
        b=KdQTAMmC4lUl77eJSSYVJlFQ8LFeEOBbVoSgQrIqE9hmvHL5fkTMGVIrVHvPPamV5s
         DQlPNgNqoehiXJMTpfV9wGpcnENgU7pN6oU0zMPGjz+n6ffIFCqj4womMoQqXMC/bzNH
         55hSpy/fmuxkfMTBv597pBtT+yIfwGty5jyhoVoiqsQo6UGmf3dSpvQzEsLvv+u1BC5/
         wYPvVy5isVBE/AWm4i8DsJz26fwKBA6NN1ej5c6lUdL81rCUcGTjOPKX5NQN8lNoMWx7
         RbdS98QueT2B9YB2/7ltjCV9ZoGoCRolKFSn1u8EKF1R9xx3L8Jc9NCWdHTAlyqmgKxS
         Pciw==
X-Gm-Message-State: APjAAAX1MP2jZYTx9T//MAG+Vepf9PwQ6YOw1HGkqq814AJEU8y6ziao
        ov+yALpv4pyxoM4MCiRB6be0QA==
X-Google-Smtp-Source: APXvYqy0UgONmpSaR+4m5izxGJwNl4tg+Z38plmGJ5jsQ0CIAYGKw48uJzmou8ImGmI6Lr3+UjT6gw==
X-Received: by 2002:a19:655b:: with SMTP id c27mr148514lfj.122.1571267479442;
        Wed, 16 Oct 2019 16:11:19 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id r5sm83652lfc.85.2019.10.16.16.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 16:11:18 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 97333101175; Thu, 17 Oct 2019 02:11:16 +0300 (+03)
Date:   Thu, 17 Oct 2019 02:11:16 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Sasha Levin <sasha.levin@oracle.com>,
        Andrew Pinski <apinski@cavium.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        mm-commits@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Ingo Molnar <mingo@elte.hu>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [patch 014/102] llist: introduce llist_entry_safe()
Message-ID: <20191016231116.inv5stimz6fg7gof@box.shutemov.name>
References: <57fd50dd./gNBvRBYvu+kYV+l%akpm@linux-foundation.org>
 <CA+55aFxr2uZADh--vtLYXjcLjNGO5t4jmTWEVZWbRuaJwiocug@mail.gmail.com>
 <CA+55aFxQRf+U0z6mrAd5QQLWgB2A_mRjY7g9vpZHCSuyjrdhxQ@mail.gmail.com>
 <CAHk-=wgr12JkKmRd21qh-se-_Gs69kbPgR9x4C+Es-yJV2GLkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgr12JkKmRd21qh-se-_Gs69kbPgR9x4C+Es-yJV2GLkA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 16, 2019 at 03:23:42PM -0700, Linus Torvalds wrote:
> [ Coming back to this, because it was annoying me ]
> 
> On Tue, Oct 11, 2016 at 4:06 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > HOWEVER - and this is really annoying - we'd need to use "-std=gnu99/gnu11"
> 
> Hmm.
> 
> I just tried it again after a long time, and "-std=gnu99" seems to
> work fine for me on the kernel these days. The old "compound literal"
> issues we had at some point seem gone.
> 
> Maybe we've cleaned everything up that used to cause problems. Or
> maybe I just mis-remembered and we should have done this long ago?

Looks like it was fixed soon after the complain:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63567

-- 
 Kirill A. Shutemov
