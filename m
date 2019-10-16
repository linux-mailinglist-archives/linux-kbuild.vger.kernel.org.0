Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A31BDA184
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2019 00:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbfJPW3O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Oct 2019 18:29:14 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45913 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbfJPW3O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Oct 2019 18:29:14 -0400
Received: by mail-lj1-f193.google.com with SMTP id q64so348346ljb.12
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Oct 2019 15:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wiSBtC86VBLvCDYSowFUSkSzxrvyNE3uFRqqBEqVmjw=;
        b=OW87+F5yjbeHzmFKKY4DOFreBz2BHOpj49bWtKSvnHQ89OLlCFGhUiEIdt/0yzcgdS
         8Ds0L2ng5rsYGR+7hdZVFvip4ZjMOrQ1ZBWfgP0k6yPDMBKMS9gOalvZEvkiIouPbf86
         T4PKWvkDo45qEiSlwJmq+GDJMO3GEUhFuBOI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wiSBtC86VBLvCDYSowFUSkSzxrvyNE3uFRqqBEqVmjw=;
        b=sXOz0JL5hBXwXm0a0Q7tBUVqr4pMSwRmhffWgwqPsC8CW19axJobWJvBNjIohP3fP+
         wQ1YmD9Hn4lV2ipg/uypZeiDSF0EhYF63QJaVDOpvN9pESNHGa/g9DQjEwYmhW2SspPm
         cnrJD+9w99QaRL1l6B3A3T9yfzam+fFCWsQFnYfcD1akePIZwP2+Xh/DLMKgR/hzNG47
         NzlQ6hRPuG76pdIehScJcv+a1kuhYeZF+AGSY0g41Me0wgdwdbzQLeZuu3TPBaFMY0iR
         G9Y75cUnuA9oGF/I6pIQ848NdzU4wZyspOKn7ck9N8eo/7bRI4ee0D5d9x3f5RTtH0A1
         6dvw==
X-Gm-Message-State: APjAAAVdL9Av+PMbK3T6SosVyEuw1zO9VDrol7qLaFpaaBQvOPAmsSXY
        UlctqCzEh/v89jFqHwxG3WHnEfpWy3Q=
X-Google-Smtp-Source: APXvYqxbsUlF9D0qAPUPbosDCQluyE+qebM4oK6LUwwcUo4HZx4H7c8rwp95iS0NeEFMYVe63lwVHg==
X-Received: by 2002:a2e:3003:: with SMTP id w3mr287195ljw.208.1571264951123;
        Wed, 16 Oct 2019 15:29:11 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id b25sm112795ljj.36.2019.10.16.15.29.10
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2019 15:29:10 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id l21so399224lje.4
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Oct 2019 15:29:10 -0700 (PDT)
X-Received: by 2002:a2e:545:: with SMTP id 66mr261224ljf.133.1571264639343;
 Wed, 16 Oct 2019 15:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <57fd50dd./gNBvRBYvu+kYV+l%akpm@linux-foundation.org>
 <CA+55aFxr2uZADh--vtLYXjcLjNGO5t4jmTWEVZWbRuaJwiocug@mail.gmail.com> <CA+55aFxQRf+U0z6mrAd5QQLWgB2A_mRjY7g9vpZHCSuyjrdhxQ@mail.gmail.com>
In-Reply-To: <CA+55aFxQRf+U0z6mrAd5QQLWgB2A_mRjY7g9vpZHCSuyjrdhxQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 16 Oct 2019 15:23:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgr12JkKmRd21qh-se-_Gs69kbPgR9x4C+Es-yJV2GLkA@mail.gmail.com>
Message-ID: <CAHk-=wgr12JkKmRd21qh-se-_Gs69kbPgR9x4C+Es-yJV2GLkA@mail.gmail.com>
Subject: Re: [patch 014/102] llist: introduce llist_entry_safe()
To:     Andrew Morton <akpm@linux-foundation.org>,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Sasha Levin <sasha.levin@oracle.com>,
        Andrew Pinski <apinski@cavium.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     mm-commits@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Ingo Molnar <mingo@elte.hu>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000ad4ca205950e8e19"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--000000000000ad4ca205950e8e19
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[ Coming back to this, because it was annoying me ]

On Tue, Oct 11, 2016 at 4:06 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> HOWEVER - and this is really annoying - we'd need to use "-std=3Dgnu99/gn=
u11"

Hmm.

I just tried it again after a long time, and "-std=3Dgnu99" seems to
work fine for me on the kernel these days. The old "compound literal"
issues we had at some point seem gone.

Maybe we've cleaned everything up that used to cause problems. Or
maybe I just mis-remembered and we should have done this long ago?

If we switched the kernel over from gnu89 to gnu99, we could use a
couple of modern C features that are really nice. The main one is
variable declarations in loops, which isn't just syntactic sugar: it
makes it much easier to reduce the scope of variables naturally, but
it also makes it easier to do legible macros for for-loops when you
can declare your helper variables inside the for-statement.

The one thing I noticed while doing this was that switching to
std=3Dgnu99 results in some funky new warnings. In particular, drm has a
number of warnings like this:

  drivers/gpu/drm/i915/gt/intel_sseu.c: In function =E2=80=98intel_sseu_mak=
e_rpcs=E2=80=99:
  drivers/gpu/drm/i915/gt/intel_sseu.c:64:10: warning: left shift of
negative value [-Wshift-negative-value]
     64 |     ~(~0 << (hweight8(ctx_sseu.subslice_mask) / 2));
        |          ^~

and that seems to be because c99 allows ones-complement machines to do
odd things with left shifts.

It doesn't make any sensible difference on a two's-complement machine,
and it's insane that c99 changed the semantics to be worse for
something that will never matter, but there you have it.

Language standards people seemingly still not realizing that undefined
behavior is a *bad* thing, not a good thing, and adding it for no good
reason? Welcome to the mad-house.

Anyway, that warning is easy enough to shut up. Would people mind
testing this patch? Does it cause problems on other architectures?
Maybe the drm code could even be made to use unsigned values for their
shifts?

Because I'd love to finally be able to do things like that

  #define llist_for_each_entry(pos, node, member) \
        for (struct llist_node *_lptr =3D (node); \
        (pos) =3D llist_entry(_lptr, typeof(*(pos)), member), !!_lptr; \
        _lptr =3D (pos)->member.next)

and not have that odd "member_address_is_nonnull()" because of how we
convert back and forth.

It would also allow us to force the caller to pointlessly have to
declare a temporary variable for the loop for the safe versions.

I only tested gnu99 - which is sufficient for the above - and didn't
see if gnu11 ends up causing more issues.. And I didn't actually test
any of the code modifications that this would allow us to do.

Adding Arnd (because he seems to like compiler updates, and works with
compiler warnings ;) and the kbuild people and arch list.

             Linus

--000000000000ad4ca205950e8e19
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_k1tu4ad50>
X-Attachment-Id: f_k1tu4ad50

IE1ha2VmaWxlIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCmluZGV4IGZmZDdh
OTEyZmM0Ni4uY2I5YWI4YTcwYjhlIDEwMDY0NAotLS0gYS9NYWtlZmlsZQorKysgYi9NYWtlZmls
ZQpAQCAtMzk3LDcgKzM5Nyw3IEBAIEhPU1RfTEZTX0xJQlMgOj0gJChzaGVsbCBnZXRjb25mIExG
U19MSUJTIDI+L2Rldi9udWxsKQogSE9TVENDICAgICAgID0gZ2NjCiBIT1NUQ1hYICAgICAgPSBn
KysKIEtCVUlMRF9IT1NUQ0ZMQUdTICAgOj0gLVdhbGwgLVdtaXNzaW5nLXByb3RvdHlwZXMgLVdz
dHJpY3QtcHJvdG90eXBlcyAtTzIgXAotCQktZm9taXQtZnJhbWUtcG9pbnRlciAtc3RkPWdudTg5
ICQoSE9TVF9MRlNfQ0ZMQUdTKSBcCisJCS1mb21pdC1mcmFtZS1wb2ludGVyIC1zdGQ9Z251OTkg
JChIT1NUX0xGU19DRkxBR1MpIFwKIAkJJChIT1NUQ0ZMQUdTKQogS0JVSUxEX0hPU1RDWFhGTEFH
UyA6PSAtTzIgJChIT1NUX0xGU19DRkxBR1MpICQoSE9TVENYWEZMQUdTKQogS0JVSUxEX0hPU1RM
REZMQUdTICA6PSAkKEhPU1RfTEZTX0xERkxBR1MpICQoSE9TVExERkxBR1MpCkBAIC00NTksNyAr
NDU5LDcgQEAgS0JVSUxEX0NGTEFHUyAgIDo9IC1XYWxsIC1XdW5kZWYgLVdlcnJvcj1zdHJpY3Qt
cHJvdG90eXBlcyAtV25vLXRyaWdyYXBocyBcCiAJCSAgIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1m
bm8tY29tbW9uIC1mc2hvcnQtd2NoYXIgLWZuby1QSUUgXAogCQkgICAtV2Vycm9yPWltcGxpY2l0
LWZ1bmN0aW9uLWRlY2xhcmF0aW9uIC1XZXJyb3I9aW1wbGljaXQtaW50IFwKIAkJICAgLVduby1m
b3JtYXQtc2VjdXJpdHkgXAotCQkgICAtc3RkPWdudTg5CisJCSAgIC1zdGQ9Z251OTkKIEtCVUlM
RF9DUFBGTEFHUyA6PSAtRF9fS0VSTkVMX18KIEtCVUlMRF9BRkxBR1NfS0VSTkVMIDo9CiBLQlVJ
TERfQ0ZMQUdTX0tFUk5FTCA6PQpAQCAtNjk5LDYgKzY5OSw3IEBAIEtCVUlMRF9DRkxBR1MJKz0g
JChjYWxsIGNjLWRpc2FibGUtd2FybmluZyxmcmFtZS1hZGRyZXNzLCkKIEtCVUlMRF9DRkxBR1MJ
Kz0gJChjYWxsIGNjLWRpc2FibGUtd2FybmluZywgZm9ybWF0LXRydW5jYXRpb24pCiBLQlVJTERf
Q0ZMQUdTCSs9ICQoY2FsbCBjYy1kaXNhYmxlLXdhcm5pbmcsIGZvcm1hdC1vdmVyZmxvdykKIEtC
VUlMRF9DRkxBR1MJKz0gJChjYWxsIGNjLWRpc2FibGUtd2FybmluZywgYWRkcmVzcy1vZi1wYWNr
ZWQtbWVtYmVyKQorS0JVSUxEX0NGTEFHUwkrPSAkKGNhbGwgY2MtZGlzYWJsZS13YXJuaW5nLCBz
aGlmdC1uZWdhdGl2ZS12YWx1ZSkKIAogaWZkZWYgQ09ORklHX0NDX09QVElNSVpFX0ZPUl9QRVJG
T1JNQU5DRQogS0JVSUxEX0NGTEFHUyArPSAtTzIK
--000000000000ad4ca205950e8e19--
