Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0ED9194964
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 21:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgCZUqT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 16:46:19 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:55227 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726034AbgCZUqT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 16:46:19 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47980eb8;
        Thu, 26 Mar 2020 20:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=CGWgvRHoerDqIX2HYCZh8ogjklM=; b=GBtBK3
        BM2+T4Ws/EMMmKx8xvhiALt29uM1uW06kXm0UO5HEOi/oX/4uMSMuhmHx3CDbfUm
        pOKstqAfjRFNInrLfIdLa/VU+DUH++J3XBnMA6ZuRat0YL9IrIaB3IOVuN61o9JN
        SUJu1V8K12yus5RxdGfSo5lP9YUw13A2NzySstKJQKkJrh/yFRfTfhP59J87jlNj
        txM2LCLNLVxYcwcPgkAdBuJvINRW8AdY1B3EEADHC/6TjfEOjXe6k3HL3itbwiiN
        N34waeT/X6NafeE+6DjKW+K7vb5rssHXmmoZlmDF1rLumFai7ZPbHjVfSnC+oLP2
        SdpMndirMIef9UkQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9e0ddec9 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Thu, 26 Mar 2020 20:38:51 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id m15so7614691iob.5;
        Thu, 26 Mar 2020 13:46:16 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1uW/EDSqc7juyVByB0cEu/+IMyOehdcuekgoQe5Fuo+pcYMmmh
        4J7ACSEdrr9K9ge+cEJRIifJILXxeEURQbU1WbI=
X-Google-Smtp-Source: ADFU+vsT1lxBNZU6tEYaINxARGEDLm5sHLmSYnbnU2+V88Os9Y74T/ah4HXpvKNpS1pgTAFg8rIzXNts4PyzMfoHxm4=
X-Received: by 2002:a02:2714:: with SMTP id g20mr9513089jaa.95.1585255574785;
 Thu, 26 Mar 2020 13:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org> <CAHmME9pnAvgErYkcvvdakvfMY8ZGKfwHHNYzpVtJ913Tgp16CQ@mail.gmail.com>
 <20200326092213.GA100918@gmail.com> <CAK7LNAQ7-wpm+g=cXeJ01vGrO1nVjfP-ornKm=SXoDEn4x+DjQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQ7-wpm+g=cXeJ01vGrO1nVjfP-ornKm=SXoDEn4x+DjQ@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Thu, 26 Mar 2020 14:46:03 -0600
X-Gmail-Original-Message-ID: <CAHmME9qnWWYV+eWVmx2yoADB9oecZKj=UgLkdSHe_=MnxedtSQ@mail.gmail.com>
Message-ID: <CAHmME9qnWWYV+eWVmx2yoADB9oecZKj=UgLkdSHe_=MnxedtSQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] x86, crypto: remove always-defined CONFIG_AS_*
 and cosolidate Kconfig/Makefiles
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     Ingo Molnar <mingo@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
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
        dri-devel <dri-devel@lists.freedesktop.org>,
        intel-gfx@lists.freedesktop.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 26, 2020 at 2:44 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> I collected more Reviewed-by and Acked-by,
> then pushed this series to
>
> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> kbuild-asinstr

But not the version of the penultimate patch that Nick ack'd....
