Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEA1193AB0
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 09:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbgCZISJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 04:18:09 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:35275 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727821AbgCZISJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 04:18:09 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 293077ea;
        Thu, 26 Mar 2020 08:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=z54i3Rpd8bQwLDnVNFV/yezuxLU=; b=boOyqs
        mCdG+80LeYcjASWpkQ1zMThj2uZPRyQj63aULJ1eho1PEeJxY053blYBVEDv/+X7
        OBQ/dBvu36pqu+6GHtzv5FnIDYJ8+m+UpNZddescE9+TJew8ZdyolfWdn7qCgNwm
        hCDQQZZIBJP70J+3MGGaus93N2IUKDn1UavfBtBSFRk4AtjJCPc/vVInIjmHn4rp
        9nXPZ9Perj3Rk83uKKf3OPmeCafWNMnHZ2UW709Lpc/xjEXipaADr7IcjmiVm9Er
        qA90IZHHNfiJD+f6KrFTRwRM8Vhig7u1XfQF2UZX5KM4Hl2qhbUe96EyxkSi5RwR
        yE1MyvOm+wrsj6Vw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f22236e6 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Thu, 26 Mar 2020 08:10:45 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id k9so5139001iov.7;
        Thu, 26 Mar 2020 01:18:06 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3XXTfJD2Ff639k67Y0c3BAp/U3FUB4V5ieGUaWa70y8GQopE/p
        x7aUHw6BxH3iMuvq1jZNZ1glMxnQZEqeTiVu7ag=
X-Google-Smtp-Source: ADFU+vsTJTCXcFJHQUwui8dbQzcKfWOUCgQIPLG0bwuItksw1ry6Mg259oUoldQgsVo9bcGoroXnNzuIzCxg8dcm+jA=
X-Received: by 2002:a02:2a4a:: with SMTP id w71mr6759564jaw.75.1585210385536;
 Thu, 26 Mar 2020 01:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org>
In-Reply-To: <20200326080104.27286-1-masahiroy@kernel.org>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Thu, 26 Mar 2020 02:12:54 -0600
X-Gmail-Original-Message-ID: <CAHmME9pnAvgErYkcvvdakvfMY8ZGKfwHHNYzpVtJ913Tgp16CQ@mail.gmail.com>
Message-ID: <CAHmME9pnAvgErYkcvvdakvfMY8ZGKfwHHNYzpVtJ913Tgp16CQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] x86, crypto: remove always-defined CONFIG_AS_*
 and cosolidate Kconfig/Makefiles
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "David S. Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Ingo Molnar <mingo@redhat.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jim Kukunas <james.t.kukunas@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        NeilBrown <neilb@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Yuanhan Liu <yuanhan.liu@linux.intel.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Very little has changed from last time, and this whole series still
looks good to me. I think I already ack'd most packages, but in case
it helps:

Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>

Since this touches a lot of stuff, it might be best to get it in as
early as possible during the merge window, as I imagine new code being
added is going to want to be touching those makefiles too.
