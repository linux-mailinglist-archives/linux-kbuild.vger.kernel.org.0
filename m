Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2F132F00B
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Mar 2021 17:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhCEQaC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Mar 2021 11:30:02 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:60114 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbhCEQ3f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Mar 2021 11:29:35 -0500
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 125GT0Im021926;
        Sat, 6 Mar 2021 01:29:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 125GT0Im021926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614961742;
        bh=L8QrSTF3pp8TOl8/M5jmpNsPkZZIsQBSgnHHOkolsOI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Rdx1vOY8EgNdlT9Aas5V3JYo9xbdUZ1by2VUKmjezBHMUGiXC3YQ1eiWJobKhB4GR
         oHrhc5e3dMK6HlpUJ1ghS70cVmXqKYqAL43jSHY8WPDIIolNP2Rd03DE/BLuyg8/TL
         ZPrFyIaiU1NhaRuKaiftvCP16dAfZDbDorUC0OA1NFUz7RsKej7xS7ZiAQaQL45PhM
         nYQNWSkNr5sMN47BxKmp3t8Ri9qza3PBYKsLdfPfqQCwfavSXaA1GwqL6erw/b/3rd
         RGzn9chdbzfNafKM3iFEV7LJJxAA/3KTduSdRFddbzhNLlmrhVhhT771/QM1ZRRJEv
         4rceAfPXFSm3g==
X-Nifty-SrcIP: [209.85.208.181]
Received: by mail-lj1-f181.google.com with SMTP id 2so3514566ljr.5;
        Fri, 05 Mar 2021 08:29:01 -0800 (PST)
X-Gm-Message-State: AOAM530mjj64qKOX18hQmHxeeHeUWqsPVUb9COocJYzgYXZ/WYH13e1i
        oEC66oTLhlmDsnosCijk6OCeMRhgvsvmFN3FRE4=
X-Google-Smtp-Source: ABdhPJyQBzXH9SKMASpk3B+p01nX2acchmU+U52whGtv7N4BThjEfTcwbN+eQIbdLKQ3vPd78q5pNTu2UCgxJH+mPZY=
X-Received: by 2002:a2e:b014:: with SMTP id y20mr1987257ljk.464.1614961739501;
 Fri, 05 Mar 2021 08:28:59 -0800 (PST)
MIME-Version: 1.0
References: <fff056a7c9e6050c2d60910f70b6d99602f3bec4.1611863075.git.jpoimboe@redhat.com>
 <CAHk-=wih0rLHsPXodpXJw_0F3bJqu=Pb_YNmPCSsYU_huoMwZA@mail.gmail.com>
 <20210128205207.awdbh4bmx56pxxjl@treble> <CAHk-=wgh4DaZvTcFfBcDMKc1QXkKjwny_Z0H5JfzdwMTNTBkSw@mail.gmail.com>
 <CAHk-=wh+3PWi2NuoQ0hbSyLpOHjaBWKcgX6N7+PfPkXzNAfMwA@mail.gmail.com>
 <20210128213409.qxnclchjyq6v23up@treble> <CAHk-=wgjwhDy-y4mQh34L+2aF=n6BjzHdqAW2=8wri5x7O04pA@mail.gmail.com>
 <20210128220803.fixcmuv4ceq5m7dy@treble> <CAK7LNARE3KO-kqdsXAbt9d9+3EqqutYd6iNki_rU2-Q9GkakbA@mail.gmail.com>
 <20210201211322.t2rxmvnrystc2ky7@treble>
In-Reply-To: <20210201211322.t2rxmvnrystc2ky7@treble>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 6 Mar 2021 01:28:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNARHoTnZ3gAvHgnYB4n-wYuboxC10A6zURh1ODGhxWd2yA@mail.gmail.com>
Message-ID: <CAK7LNARHoTnZ3gAvHgnYB4n-wYuboxC10A6zURh1ODGhxWd2yA@mail.gmail.com>
Subject: Re: [PATCH RFC] kbuild: Prevent compiler mismatch with external modules
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Miroslav Benes <mbenes@suse.cz>,
        David Laight <David.Laight@aculab.com>,
        Jessica Yu <jeyu@kernel.org>
Content-Type: multipart/mixed; boundary="000000000000cf329c05bccc9487"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--000000000000cf329c05bccc9487
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 2, 2021 at 6:13 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Fri, Jan 29, 2021 at 08:17:51AM +0900, Masahiro Yamada wrote:
> > [3]
> > Peterz already pointed out asm-goto as an example of ABI mismatch.
> >
> > I remember a trouble reported in the past due
> > to the mismatch of -mstack-protector-guard-offset.
> >
> > https://bugzilla.kernel.org/show_bug.cgi?id=201891
> >
> > This has already been fixed,
> > and it will no longer happen though.
>
> This is kind of concerning though.  It would be nice to somehow store
> KCLAGS in the config and warn if it changes unexpectedly.
>
> This can be a problem not only for OOT modules, but for regular kernel
> builds which have a .config copied from somewhere.
>
> Because of the toolchain-dependent kconfig options, features can
> silently disappear if the toolchain doesn't support them, due to a
> different compiler version, or even a missing library.
>
> > [2]
> >
> > As for this patch, it is wrong to do this check in the Makefile
> > parse stage.
> >
> > "make M=...  clean"
> > "make M=...  help"
> >
> > etc. will fail.
> > Such targets do not require the compiler in the first place.
> >
> > This check must be done before starting building something,
> >
> > Also, this patch is not applicable.
> > gcc-version.sh and clang-version.sh do not exist.
> > See linux-next.
>
> Something like so?

No, I do not think so.


>
> diff --git a/Makefile b/Makefile
> index 95ab9856f357..10ca621369fb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1721,12 +1721,25 @@ KBUILD_MODULES := 1
>
>  build-dirs := $(KBUILD_EXTMOD)
>  PHONY += modules
> -modules: $(MODORDER)
> +modules: ext_compiler_check $(MODORDER)


For the single thread build, yes
GNU Make will run the targets from left to right,
so ext_compiler_check is run before compiling
any build artifact.

If -j <N> option is given, there is no guarantee
that ext_compiler_check finishes first.



>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
>
>  $(MODORDER): descend
>         @:
>
> +orig_name   := $(if $(CONFIG_CC_IS_GCC),GCC,CLANG)
> +orig_minor  := $(shell expr $(if $(CONFIG_CC_IS_GCC),$(CONFIG_GCC_VERSION),$(CONFIG_CLANG_VERSION)) / 100)
> +cur_namever := $(shell $(srctree)/scripts/cc-version.sh $(CC))
> +cur_name    := $(word 1,$(cur_namever))
> +cur_minor   := $(shell expr $(word 2,$(cur_namever)) / 100)

These are still calculated by 'make M=... clean' or 'make M=... help'.
Using '=' assignment solves it, but the code is still ugly.


I attached my alternative implementation.


> +PHONY += ext_compiler_check
> +ext_compiler_check:
> +       @if [ $(orig_name) != $(cur_name) ] || [ $(orig_minor) != $(cur_minor) ]; then \
> +               echo >&2 "warning: The compiler differs from the version which was used to build the kernel."; \
> +               echo >&2 "warning: Some kernel features are compiler-dependent."; \
> +               echo >&2 "warning: It's recommended that you change your compiler to match the version in the .config file."; \
> +       fi
> +
>  PHONY += modules_install
>  modules_install: _emodinst_ _emodinst_post
>
>

--
Best Regards
Masahiro Yamada

--000000000000cf329c05bccc9487
Content-Type: application/x-patch; 
	name="0001-kbuild-show-notice-if-a-different-compiler-is-used-f.patch"
Content-Disposition: attachment; 
	filename="0001-kbuild-show-notice-if-a-different-compiler-is-used-f.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_klwif6ch0>
X-Attachment-Id: f_klwif6ch0

RnJvbSA4MTUyYzQ3ZDE5Y2FiNWFmMzYxZDA5N2ZjYjkzOWE0ZThlY2VmYTI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3Jn
PgpEYXRlOiBGcmksIDUgTWFyIDIwMjEgMTQ6MTA6MjYgKzA5MDAKU3ViamVjdDogW1BBVENIXSBr
YnVpbGQ6IHNob3cgbm90aWNlIGlmIGEgZGlmZmVyZW50IGNvbXBpbGVyIGlzIHVzZWQgZm9yCiBl
eHRlcm5hbCBtb2R1bGUgYnVpbGQKClRoaXMgY29tbWl0IHNob3dzIGEgbm90aWNlIHVubGVzcyB0
aGUgY29tcGlsZXIgaXMgZXhhY3RseSB0aGUgc2FtZS4KCm5vdGljZTogdGhlIGNvbXBpbGVyIGRp
ZmZlcnMgZnJvbSB0aGUgb25lIHVzZWQgdG8gYnVpbGQgdGhlIGtlcm5lbAogIFRoZSBrZXJuZWwg
d2FzIGJ1aWx0IGJ5OiBnY2MgKEdDQykgMTAuMC4xIDIwMjAwMzI4IChSZWQgSGF0IDEwLjAuMS0w
LjExKQogIFlvdSBhcmUgdXNpbmc6ICAgICAgICAgICBnY2MgKEdDQykgMTAuMi4xIDIwMjAxMTI1
IChSZWQgSGF0IDEwLjIuMS05KQoKQ2hlY2sgdGhlIGRpZmZlcmVuY2UsIGFuZCBkZXRlcm1pbmUg
aWYgeW91IGFyZSBPSyB3aXRoIHRoYXQuIElmIHlvdQpiZWxpZXZlIG1peGluZyB0d28gY29tcGls
ZXJzIGlzIE9LLCBwbGVhc2UgcHJvY2VlZCBhdCB5b3VyIHJpc2suCgpTaWduZWQtb2ZmLWJ5OiBN
YXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPgotLS0KIE1ha2VmaWxlIHwgMTIg
KysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggYTMzMzZkOWI0YTIy
Li5lNTkyNDU2NjczYTMgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC0x
Nzc5LDYgKzE3NzksMTYgQEAgY2xlYW4tZGlycyA6PSAkKEtCVUlMRF9FWFRNT0QpCiBjbGVhbjog
cm0tZmlsZXMgOj0gJChLQlVJTERfRVhUTU9EKS9Nb2R1bGUuc3ltdmVycyAkKEtCVUlMRF9FWFRN
T0QpL21vZHVsZXMubnNkZXBzIFwKIAkkKEtCVUlMRF9FWFRNT0QpL2NvbXBpbGVfY29tbWFuZHMu
anNvbiAkKEtCVUlMRF9FWFRNT0QpLy50aGlubHRvLWNhY2hlCiAKK1BIT05ZICs9IHByZXBhcmUK
KyMgbm93IGV4cGFuZCB0aGlzIGludG8gYSBzaW1wbGUgdmFyaWFibGUgdG8gcmVkdWNlIHRoZSBj
b3N0IG9mIHNoZWxsIGV2YWx1YXRpb25zCitwcmVwYXJlOiBDQ19WRVJTSU9OX1RFWFQgOj0gJChD
Q19WRVJTSU9OX1RFWFQpCitwcmVwYXJlOgorCUBpZiBbICIkKENDX1ZFUlNJT05fVEVYVCkiICE9
ICQoQ09ORklHX0NDX1ZFUlNJT05fVEVYVCkgXTsgdGhlbiBcCisJCWVjaG8gIm5vdGljZTogdGhl
IGNvbXBpbGVyIGRpZmZlcnMgZnJvbSB0aGUgb25lIHVzZWQgdG8gYnVpbGQgdGhlIGtlcm5lbCI7
IFwKKwkJZWNobyAiICBUaGUga2VybmVsIHdhcyBidWlsdCBieTogIiQoQ09ORklHX0NDX1ZFUlNJ
T05fVEVYVCk7IFwKKwkJZWNobyAiICBZb3UgYXJlIHVzaW5nOiAgICAgICAgICAgJChDQ19WRVJT
SU9OX1RFWFQpIjsgXAorCWZpCisKIFBIT05ZICs9IGhlbHAKIGhlbHA6CiAJQGVjaG8gICcgIEJ1
aWxkaW5nIGV4dGVybmFsIG1vZHVsZXMuJwpAQCAtMTc5MCw3ICsxODAwLDcgQEAgaGVscDoKIAlA
ZWNobyAgJycKIAogIyBuby1vcCBmb3IgZXh0ZXJuYWwgbW9kdWxlIGJ1aWxkcwotUEhPTlkgKz0g
cHJlcGFyZSBtb2R1bGVzX3ByZXBhcmUKK1BIT05ZICs9IG1vZHVsZXNfcHJlcGFyZQogCiBlbmRp
ZiAjIEtCVUlMRF9FWFRNT0QKIAotLSAKMi4yNy4wCgo=
--000000000000cf329c05bccc9487--
