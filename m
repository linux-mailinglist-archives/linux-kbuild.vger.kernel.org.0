Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 103DF2FE02B
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 04:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729036AbhAUDwl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 22:52:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728511AbhAUCE1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 21:04:27 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36919C061575;
        Wed, 20 Jan 2021 18:03:28 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id n2so1031593iom.7;
        Wed, 20 Jan 2021 18:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=UQ1sOWJk4CRc1VRTEUkbh3QAItciVZ4tLwnuC/1/JiU=;
        b=Bq+t2V2aAIe3czwI6nQ+U3PmrrmP0lwIAU0m9eHsoPYFMFoa5mkZ+/DSCWbE1xONu1
         bR+ns1Jx/M9uzBeQX8R8/SqBf8l0WlB/q+NZSya8tXn8hHqYJIu8xY9e5tvHTDRJk+AZ
         D/MH8cKiQmLcPHkpRrEah5lyAFlyLc3pdBus5Y8HR+Qk6wb6yPWfX6PlISJfQdEVilmq
         YMViA6XtMUHTukyQL9Rdgy2FbSh2ekilhnaRd4qlEZ+TGAWmzmdIIXy+VexdQAE1WXzb
         LXkPhWOKcsudK3XJAKgQCoJ9872walj+OWq52DWV7j9M4o2QLodpbbaRDwTvXbq9iwGl
         o7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=UQ1sOWJk4CRc1VRTEUkbh3QAItciVZ4tLwnuC/1/JiU=;
        b=JttPXBUwAjUNq6HPu24D28LQhI2ppkjIo9Cg3GRx+w5XmL8iNV+2dnAMlDQ3xBYEgE
         pU2D+1M3oaEVujkhKd1ublxg2v1clf3vSUa3/VorY2ztu94Gmq+Gs3vRVg9q499JVE0+
         B/BhKIyklpq1wAaGkjgNyUH+Y8KoFCd6qS4U+IK+r0PuMVUl6x+us5M+eX8dIpnpum3v
         frRBq3dTy7TwPYISLeAwF4RQQAkhIr/nTzgr7HcoQhCYKGPHEMpIrT1ld38gRZhvOidD
         IcXcrIHrJnHJVBC31iiMpVjKWQ0VRG6JmPvmIHBxKJhCqua00G895VgXTj9bV2gEPAfp
         aO+g==
X-Gm-Message-State: AOAM532mx9QPVDT5vROMwoX55JhvUkothrWwHboYfEEx8iS60DBLZ9vv
        WtKxtI1GlWlRboo7OW3e1UMM+zrSMLP5YcPxCqE=
X-Google-Smtp-Source: ABdhPJyKPZGiZN4rZPH0yCZMWlruh1/9mZXgpIRQldf5bECd3DJT0yLvzZEew4/2oGrkJfZ7cb03i6qFYqYIhq72SyE=
X-Received: by 2002:a05:6e02:d0:: with SMTP id r16mr10371308ilq.112.1611194607275;
 Wed, 20 Jan 2021 18:03:27 -0800 (PST)
MIME-Version: 1.0
References: <20210113061958.886723-1-morbo@google.com> <20210116094357.3620352-1-morbo@google.com>
 <CA+icZUUgTuD6fO_AZFs9KoRFS8FUmyhezvYeeoRX2dveG_ifDA@mail.gmail.com>
 <CAGG=3QXZTR_f9pKzAR=LrALmMzdDqsvWM_zrTXOb2PpiDGB-+A@mail.gmail.com>
 <CA+icZUWf05ek+DFsJNyBc-4cg0s6cVrn=rNJDyL4RJ6=fMO5NA@mail.gmail.com>
 <CA+icZUVD1AHaXYu4Ne8JhzmtMR5DReL4C=ZxKfA0hjLtbC79qQ@mail.gmail.com>
 <CA+icZUUTJbwmTYCDJhyRtif3BdsB_yzQ3bSdLR62EmttJf3Row@mail.gmail.com>
 <CA+icZUUfWR1v3GStn6t_6MYDmwTdJ_zDwBTe2jmQRg7aOA1Q2A@mail.gmail.com>
 <CA+icZUU-3i7Of71C6XaNmee7xD4y_DeoWJFvUHnMUyBaMN3Ywg@mail.gmail.com>
 <CA+icZUXmn15w=kSq2CZzQD5JggJw_9AEam=Sz13M0KpJ68MWZg@mail.gmail.com>
 <CA+icZUWUPCuLWCo=kuPr9YZ4-NZ3F8Fv1GzDXPbDevyWjaMrJg@mail.gmail.com>
 <CAGG=3QW+ayBzCxOusLyQ0-y5K5C_3hNXjara_pYOcxK8MseN9g@mail.gmail.com>
 <CA+icZUU1HihUFaEHzF69+01+Picg8aq6HAqHupxiRqyDGJ=Mpw@mail.gmail.com>
 <CA+icZUUuzA5JEXyVzKbVX+T3xeOdRAU6-mntbo+VwwTxqmN7LA@mail.gmail.com>
 <CAGG=3QWmOA+yM2GJF+cHUb7wUq6yiBpHasa-ry9OhAdvciDm6Q@mail.gmail.com>
 <CA+icZUVwbWDtGUzMEkitxYn2UvbZPnFTxfJyDOY46j6BTK0deQ@mail.gmail.com>
 <CA+icZUXa9wvSWe=21_gjAapoHpbgBmYzFpQjb=o_WRQgK+O4gA@mail.gmail.com> <CAGG=3QUcaY1wzJhBD4ZGhPSNPik-kL0PuoE1SJqkFJEM_mkGYA@mail.gmail.com>
In-Reply-To: <CAGG=3QUcaY1wzJhBD4ZGhPSNPik-kL0PuoE1SJqkFJEM_mkGYA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 21 Jan 2021 03:03:15 +0100
Message-ID: <CA+icZUU+OWW46CVq4Co-y7hckGjoV5bbqxS-G+HDqUDci_AzHw@mail.gmail.com>
Subject: Re: [PATCH v5] pgo: add clang's Profile Guided Optimization infrastructure
To:     Bill Wendling <morbo@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Fangrui Song <maskray@google.com>
Content-Type: multipart/mixed; boundary="0000000000003b46d105b95f7a76"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--0000000000003b46d105b95f7a76
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 18, 2021 at 10:56 PM Bill Wendling <morbo@google.com> wrote:
>
> On Mon, Jan 18, 2021 at 9:26 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Mon, Jan 18, 2021 at 1:39 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > On Mon, Jan 18, 2021 at 3:32 AM Bill Wendling <morbo@google.com> wrote:
> > > >
> > > > On Sun, Jan 17, 2021 at 4:27 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > > > >
> > > > > [ big snip ]
> > > >
> > > > [More snippage.]
> > > >
> > > > > [ CC Fangrui ]
> > > > >
> > > > > With the attached...
> > > > >
> > > > >    [PATCH v3] module: Ignore _GLOBAL_OFFSET_TABLE_ when warning for
> > > > > undefined symbols
> > > > >
> > > > > ...I was finally able to boot into a rebuild PGO-optimized Linux-kernel.
> > > > > For details see ClangBuiltLinux issue #1250 "Unknown symbol
> > > > > _GLOBAL_OFFSET_TABLE_ loading kernel modules".
> > > > >
> > > > Thanks for confirming that this works with the above patch.
> > > >
> > > > > @ Bill Nick Sami Nathan
> > > > >
> > > > > 1, Can you say something of the impact passing "LLVM_IAS=1" to make?
> > > >
> > > > The integrated assembler and this option are more-or-less orthogonal
> > > > to each other. One can still use the GNU assembler with PGO. If you're
> > > > having an issue, it may be related to ClangBuiltLinux issue #1250.
> > > >
> > > > > 2. Can you please try Nick's DWARF v5 support patchset v5 and
> > > > > CONFIG_DEBUG_INFO_DWARF5=y (see attachments)?
> > > > >
> > > > I know Nick did several tests with PGO. He may have looked into it
> > > > already, but we can check.
> > > >
> > >
> > > Reproducible.
> > >
> > > LLVM_IAS=1 + DWARF5 = Not bootable
> > >
> > > I will try:
> > >
> > > LLVM_IAS=1 + DWARF4
> > >
> >
> > I was not able to boot into such a built Linux-kernel.
> >
> PGO will have no effect on debugging data. If this is an issue with
> DWARF, then it's likely orthogonal to the PGO patch.
>
> > For me worked: DWARF2 and LLVM_IAS=1 *not* set.
> >
> > Of course, this could be an issue with my system's LLVM/Clang.
> >
> > Debian clang version
> > 12.0.0-++20210115111113+45ef053bd709-1~exp1~20210115101809.3724
> >
> Please use the official clang 11.0.1 release
> (https://releases.llvm.org/download.html), modifying the
> kernel/pgo/Kconfig as I suggested above. The reason we specify clang
> 12 for the minimal version is because of an issue that was recently
> fixed.
>

I downgraded to clang-11.1.0-rc1.
( See attachment. )

Doing the first build with PGO enabled plus DWARF5 and LLVM_IAS=1 works.

But again after generating vmlinux.profdata and doing the PGO-rebuild
- the resulting Linux-kernel does NOT boot in QEMU or on bare metal.
With GNU/as I can boot.

So this is independent of DWARF v4 or DWARF v5 (LLVM_IAS=1 and DWARF
v2 is not allowed).
There is something wrong (here) with passing LLVM_IAS=1 to make when
doing the PGO-rebuild.

Can someone please verify and confirm that the PGO-rebuild with
LLVM_IAS=1 boots or boots not?

Thanks.

- Sedat -

> > Can you give me a LLVM commit-id where you had success with LLVM_IAS=1
> > and especially CONFIG_DEBUG_INFO_DWARF5=y?
> > Success means I was able to boot in QEMU and/or bare metal.
> >
> The DWARF5 patch isn't in yet, so I don't want to rely upon it too much.
>
> -bw

--0000000000003b46d105b95f7a76
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-pgo-Allow-to-use-clang-v11.0.1.patch"
Content-Disposition: attachment; 
	filename="0001-pgo-Allow-to-use-clang-v11.0.1.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kk67iy4m0>
X-Attachment-Id: f_kk67iy4m0

RnJvbSBhNjlkY2MzNzdjNjAxNTI1ZDhjNzYwZTdiMjBjNWQwNmVhZjFmZTc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPgpE
YXRlOiBUdWUsIDE5IEphbiAyMDIxIDAwOjQ0OjM2ICswMTAwClN1YmplY3Q6IFtQQVRDSF0gcGdv
OiBBbGxvdyB0byB1c2UgY2xhbmcgPj0gdjExLjAuMQoKLS0tCiBrZXJuZWwvcGdvL0tjb25maWcg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9rZXJuZWwvcGdvL0tjb25maWcgYi9rZXJuZWwvcGdvL0tjb25maWcKaW5kZXgg
NzZhNjQwYjZjZjZlLi41ZmU5NjM1YWM2NGMgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9wZ28vS2NvbmZp
ZworKysgYi9rZXJuZWwvcGdvL0tjb25maWcKQEAgLTgsNyArOCw3IEBAIGNvbmZpZyBQR09fQ0xB
TkcKIAlib29sICJFbmFibGUgY2xhbmcncyBQR08tYmFzZWQga2VybmVsIHByb2ZpbGluZyIKIAlk
ZXBlbmRzIG9uIERFQlVHX0ZTCiAJZGVwZW5kcyBvbiBBUkNIX1NVUFBPUlRTX1BHT19DTEFORwot
CWRlcGVuZHMgb24gQ0NfSVNfQ0xBTkcgJiYgQ0xBTkdfVkVSU0lPTiA+PSAxMjAwMDAKKwlkZXBl
bmRzIG9uIENDX0lTX0NMQU5HICYmIENMQU5HX1ZFUlNJT04gPj0gMTIwMDAwIHx8IENMQU5HX1ZF
UlNJT04gPj0gMTEwMDAxCiAJaGVscAogCSAgVGhpcyBvcHRpb24gZW5hYmxlcyBjbGFuZydzIFBH
TyAoUHJvZmlsZSBHdWlkZWQgT3B0aW1pemF0aW9uKSBiYXNlZAogCSAgY29kZSBwcm9maWxpbmcg
dG8gYmV0dGVyIG9wdGltaXplIHRoZSBrZXJuZWwuCi0tIAoyLjMwLjAKCg==
--0000000000003b46d105b95f7a76--
