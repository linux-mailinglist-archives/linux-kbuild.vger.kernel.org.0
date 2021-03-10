Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7A2333B75
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 12:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhCJLbH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Mar 2021 06:31:07 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:63310 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbhCJLar (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Mar 2021 06:30:47 -0500
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 12ABUYJu006714;
        Wed, 10 Mar 2021 20:30:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 12ABUYJu006714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615375835;
        bh=/fSoNed1kAtUQ4lVH3GglUtu6K4SYi00Z3FO6YwKUwk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jNpFaSMvzSkMdSDrPrCfU+Bg2ibAEiJZDgR+FVFVBm/zbS5GnC+V1HP7ZDotRCFW3
         Bf0d8EJb5j6Dbf9RBRzw5a+IOkWwx6rN9U7IL+NjQN8NIvhioOlZSjDIokOU0cxv+U
         gM9qDp3KDMrO/SOluuLgmvfUHLwsj/RxkUTTHrjyCTRyDvF1wKkxBtfsHSUoCZH1+f
         WpAKgATOYSq5e0Y08kTFBf1o10U/SikDN08U329jXy/BEF+ZT1UTyzdDBVyMLH0vMJ
         YspfWoyxQWwQkKhbxV8oBNm0UYK836CCp/jNDWenNCDrKJFNtqADL8JTVFY9Uyybm0
         4TpXXFXorbsbA==
X-Nifty-SrcIP: [209.85.210.171]
Received: by mail-pf1-f171.google.com with SMTP id 16so10346709pfn.5;
        Wed, 10 Mar 2021 03:30:35 -0800 (PST)
X-Gm-Message-State: AOAM533ulqcd3KUUwGEYTIbW3lvGIEHFRraZtzrcsOJKJbi/mqXLatD5
        I0KblpY+IH1X1fsDGFgphxH1gN0f6MnByYeh1Wo=
X-Google-Smtp-Source: ABdhPJx8MzgNXXYk42bIEYDrXHt+CuCAIW8G6SqXBkM4fVIWSQi25NzxQsqdkrF4/dJxvXIIiNzXkRMuX7WJIc93fqc=
X-Received: by 2002:a65:428b:: with SMTP id j11mr2469119pgp.47.1615375834478;
 Wed, 10 Mar 2021 03:30:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1615354376.git.viresh.kumar@linaro.org> <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
In-Reply-To: <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 10 Mar 2021 20:29:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNAST04XTt7Y0DnSADHgAw-zy61HUcRJSyYRvy2rGHMdn4A@mail.gmail.com>
Message-ID: <CAK7LNAST04XTt7Y0DnSADHgAw-zy61HUcRJSyYRvy2rGHMdn4A@mail.gmail.com>
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source files
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000cb315305bd2cfea8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--000000000000cb315305bd2cfea8
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 10, 2021 at 8:24 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Mar 10, 2021 at 2:35 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Since the overlays dtb files are now named as .dtbo, there is a lot of
> > interest in similarly naming the overlay source dts files as .dtso.
> >
> > This patch makes the necessary changes to allow .dtso format for overlay
> > source files.
> >
> > Note that we still support generating .dtbo files from .dts files. This
> > is required for the source files present in drivers/of/unittest-data/,
> > because they can't be renamed to .dtso as they are used for some runtime
> > testing as well.
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  scripts/Makefile.lib | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index bc045a54a34e..59e86f67f9e0 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -339,7 +339,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
> >
> >  quiet_cmd_dtc = DTC     $@
> >  cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> > -       $(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
> > +       $(DTC) -I dts -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
>
> Even without "-I dts",
>
>    inform = guess_input_format(arg, "dts");
>
> seems to fall back to "dts" anyway,
> but I guess you wanted to make this explicit, correct?
>
> I will drop the ugly -O.
> https://patchwork.kernel.org/project/linux-kbuild/patch/20210310110824.782209-1-masahiroy@kernel.org/
>
> I will queue it to linux-kbuild/fixes.
>
>


BTW, is the attached patch good for DTC?

I do not know when '-O dtbo' is useful,
unless I am missing something.


-- 
Best Regards
Masahiro Yamada

--000000000000cb315305bd2cfea8
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-dtc-Remove-O-dtbo-support.patch"
Content-Disposition: attachment; 
	filename="0001-dtc-Remove-O-dtbo-support.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_km3czox00>
X-Attachment-Id: f_km3czox00

RnJvbSBlZWFjNzEwMjg5YTIyMzk3YzZhZTRlOTBhOTMzNGM0ZjdlMTc4Njg4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3Jn
PgpEYXRlOiBXZWQsIDEwIE1hciAyMDIxIDE5OjQ4OjA1ICswOTAwClN1YmplY3Q6IFtQQVRDSF0g
ZHRjOiBSZW1vdmUgLU8gZHRibyBzdXBwb3J0CgpUaGlzIHBhcnRpYWxseSByZXZlcnRzIDE2M2Yw
NDY5YmYyZSAoImR0YzogQWxsb3cgb3ZlcmxheXMgdG8gaGF2ZQouZHRibyBleHRlbnNpb24iKS4K
CkkgZG8gbm90IHVuZGVyc3RhbmQgd2h5IHdlIG5lZWQgdG8gc3VwcG9ydCAiZHRibyIgYXMgLS1v
dXQtZm9ybWF0LgoKKi5kdGIgYW5kICouZHRibyBoYXZlIHRoZSBzYW1lIGZvcm1hdCwgImR0YiIu
CgpTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPgot
LS0KIGR0Yy5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHRjLmMgYi9kdGMuYwppbmRleCA4MzhjNWRmLi4zOTYyZDNmIDEwMDY0NAotLS0gYS9k
dGMuYworKysgYi9kdGMuYwpAQCAtMzU5LDggKzM1OSw2IEBAIGludCBtYWluKGludCBhcmdjLCBj
aGFyICphcmd2W10pCiAjZW5kaWYKIAl9IGVsc2UgaWYgKHN0cmVxKG91dGZvcm0sICJkdGIiKSkg
ewogCQlkdF90b19ibG9iKG91dGYsIGR0aSwgb3V0dmVyc2lvbik7Ci0JfSBlbHNlIGlmIChzdHJl
cShvdXRmb3JtLCAiZHRibyIpKSB7Ci0JCWR0X3RvX2Jsb2Iob3V0ZiwgZHRpLCBvdXR2ZXJzaW9u
KTsKIAl9IGVsc2UgaWYgKHN0cmVxKG91dGZvcm0sICJhc20iKSkgewogCQlkdF90b19hc20ob3V0
ZiwgZHRpLCBvdXR2ZXJzaW9uKTsKIAl9IGVsc2UgaWYgKHN0cmVxKG91dGZvcm0sICJudWxsIikp
IHsKLS0gCjIuMjcuMAoK
--000000000000cb315305bd2cfea8--
