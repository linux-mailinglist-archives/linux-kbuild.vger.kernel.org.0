Return-Path: <linux-kbuild+bounces-2802-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 156BC946C19
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 05:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63ED7B2138A
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 03:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356DF29B0;
	Sun,  4 Aug 2024 03:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I67YuE8v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A3828EA
	for <linux-kbuild@vger.kernel.org>; Sun,  4 Aug 2024 03:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722743916; cv=none; b=iAfnKupbKd/FexwOvB5vU63wh6O35N3hmWrXnBujTIWxoW+F6YsXs51MvYduOI1N5rdT+miWPebMlNfPmlLXkNJGoZn253WwbITUXe2hzq107qKa8ovXqmD6x14LY6aaSr1t9Nkj6gqkFscMB9aBbmKY3ZthKgBhXmML2vXvV6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722743916; c=relaxed/simple;
	bh=Z4erN/g/aEFdKH3/PRzlLfV90T46xGnMMGSXfcQSOm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5UXldo4p4MstJIDnzcn+0y0GFXiM5Q+rH83eh5kr2bxKKtsBqlKAYKPywlkQ6oyWs8T9nh09iqZJ/meqvdlJ4hMVvBNF5llWoFSgip5NTRB4hfUPCoOmX9CTkrScbXng19L8kDMtZ0yPlhKTrpkPwFAm7/NRZ5IUy1SHf58Vt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I67YuE8v; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52efdf02d13so15534400e87.2
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Aug 2024 20:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722743912; x=1723348712; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O6KJ5LDSaAdXGO/6qjD5UgyEenle68UGFDn4sCf3GT8=;
        b=I67YuE8v6B6aJTqT+oqGODOXS1TwtDOGFSp4EBrPcHB2nbTroKS1wSfryNcyT6l37B
         7Ucmea51z2TFzFKWtdSbIPY1ZOfV26TANPnWD48EF/Hv1yWFLFyIn95OjumxaNjsHosH
         NpPdhuxk9YYVlObYZ705O5ilCKMfYLixjbgGribE63ihoKmA+7PgoKcFWfAeHv5scKW5
         wNMD0KDukSjMrGU/Ug6581cJScKBrUhOvJhEIxOFh3jNod+PbFWUT1/GpiZW3dLsDfF6
         /PIjsbwC1bo6B3ylGKtgpRmZ/GnPc5wFEi2s32tn5sOVW82nr868hPAqD3vxiwMFCgxN
         AMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722743912; x=1723348712;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6KJ5LDSaAdXGO/6qjD5UgyEenle68UGFDn4sCf3GT8=;
        b=Lq77VOJWO0q4F4Hs1bd1RQCDha4DTOIf/O7qvYKlYFGa6KLcJF2IQ4KKlnMTT0jf8W
         /EIFWBjOkcSUS1+j6XHSBlzKW0sQ7SnCnClsmyna5XPB7AMgeXDl/0D7epSLD5A3uohH
         OfYM5BcrDVCjvyYCTNpOPfbhwNy2AY8v/L/G0QOS26Iu/unhLyIrviB7Rl6voi3SzSCG
         U98G03Sx1wVWPqw2LomAP1lDT5QUIT5QEM33kZ2kPkmmgIWIiFEGyb5pPo9O4bBpaeVH
         EtIMoKSkXmP+ERGbZ7HOHMNwlXLOT4sgTYbVDs5NcWw0lgUr6YG2RX6sSqwm8+bGJ6Q7
         YaEg==
X-Forwarded-Encrypted: i=1; AJvYcCVvn0RWOPLmt3BRTDnRNO0AC8ulFOrhry/FXi4N6Y1Gn1sc4YqBZVelRTiObgh3Io70tqsrT7veD+pZJnTx399hMvZ7Ua15mHm+WsfE
X-Gm-Message-State: AOJu0YzbkclcvejFcAR0hNzh8ylTbb8TtDXpZEj58Ft72alKKDGBiMMI
	n8N6KQDZ6J7XcAxJL3yqDq+o7Q+OonepE5ILNDkLABBbw+0gUVBAEKAiVMRGZR8cFruyFyRpmbL
	9Y4/hNVGC0V94xvVUY0Kvm7mlNos=
X-Google-Smtp-Source: AGHT+IE7wnxVimsHgTQGeFKZwNqAfgGytv5kuEfG4apU6W23IjmlFEkaS9LNJrA/2qwrLEh7RHo01R0CMDywfPX8sHg=
X-Received: by 2002:a05:6512:1390:b0:52c:a20e:4da4 with SMTP id
 2adb3069b0e04-530bb3bd03cmr6540182e87.57.1722743911669; Sat, 03 Aug 2024
 20:58:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+icZUWUL956KOKGLG+h1VA9TTXaUc7MS12soUi62q2gj-+tqg@mail.gmail.com>
 <CA+icZUX-vannYgAHt3O00kwWXLX_cFpr6JJadX==bpZcUzh_7w@mail.gmail.com>
 <CA+icZUU-ktXDwQPA9cbXPM_A9pKoOzUCJ821Z2U1vzFkujMErA@mail.gmail.com>
 <CACvgo52-KbJHUde8kP5-=HdHoCFEcAt=mmy1i=MR7Er7xZz67w@mail.gmail.com> <CAK7LNARfgd=uqot6QxK5njHVXhb06yJXrJ+j=F=Uzh=6a6mm=Q@mail.gmail.com>
In-Reply-To: <CAK7LNARfgd=uqot6QxK5njHVXhb06yJXrJ+j=F=Uzh=6a6mm=Q@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 4 Aug 2024 05:57:54 +0200
Message-ID: <CA+icZUUQadYjAXiCNx7PmKDV20WctvnzkXC3R2F7FM4Gzcm39Q@mail.gmail.com>
Subject: Re: ZSTD compression-level when CONFIG_MODULE_COMPRESS_ZSTD=y
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Emil Velikov <emil.l.velikov@gmail.com>, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Piotr Gorski <lucjan.lucjanov@gmail.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, 
	q66 <q66@chimera-linux.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Torge Matthies <openglfreak@googlemail.com>
Content-Type: multipart/mixed; boundary="000000000000e50840061ed39293"

--000000000000e50840061ed39293
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 4, 2024 at 5:30=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
...
> > Which is why, I think it's up-to your distro/builder to choose the
> > policy. Here is what we've been using In Arch `ZSTD_CLEVEL=3D19 make ..=
.
> > modules_install`.
> >
> > Tl:Dr: You'd want to use `ZSTD_CLEVEL` (or equivalent if using xz)
> > during make modules_install **depending** on the components used and
> > their version.
>
>
> Ah, it is nice.
> I remembered a patch that adds a new CONFIG option to specify the
> compression level,
> but it is possible via ZSTD_CLEVEL.
>
>
> Currently, multithreading (-T0) is always on in scripts/Makefile.modinst,
> but this is questionable to me.
>

I tried with the attached patch and Linux v6.10.3 ...

root# du -s -m /lib/modules/* | sort
103     /lib/modules/6.10-amd64 <--- Debian and XZ compressed modules
103     /lib/modules/6.9.12-amd64
115     /lib/modules/6.10.3-1-amd64-clang18-kcfi <--- with patch
140     /lib/modules/6.10.1-1-amd64-clang18-kcfi <--- without patch
395     /lib/modules/6.1.0-23-amd64

97      /var/cache/apt/archives/linux-image-6.10-amd64_6.10.1-1~exp1_amd64.=
deb
136     linux-image-6.10.1-1-amd64-clang18-kcfi_6.10.1-1~trixie+dileks1_amd=
64.deb
111     linux-image-6.10.3-1-amd64-clang18-kcfi_6.10.3-1~trixie+dileks1_amd=
64.deb
<--- with patch

-Sedat-

--000000000000e50840061ed39293
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-kbuild-Use-better-compress-level-for-zstd-compressed.patch"
Content-Disposition: attachment; 
	filename="0001-kbuild-Use-better-compress-level-for-zstd-compressed.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lzf0x7230>
X-Attachment-Id: f_lzf0x7230

RnJvbSA0Y2ExMDM2OGQ5MmFkMzg1OTM0Mjc4YzlhNDM2NDgzMTk2MWU1NzY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPgpE
YXRlOiBTYXQsIDMgQXVnIDIwMjQgMTc6Mzk6NDQgKzAyMDAKU3ViamVjdDogW1BBVENIXSBrYnVp
bGQ6IFVzZSBiZXR0ZXIgY29tcHJlc3MtbGV2ZWwgZm9yIHpzdGQgY29tcHJlc3NlZCBtb2R1bGVz
CgpTaWduZWQtb2ZmLWJ5OiBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPgotLS0K
IHNjcmlwdHMvTWFrZWZpbGUubW9kaW5zdCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvTWFrZWZpbGUubW9k
aW5zdCBiL3NjcmlwdHMvTWFrZWZpbGUubW9kaW5zdAppbmRleCAwYWZkNzU0NzI2NzkuLjJhOGIz
N2M4MGNiZiAxMDA2NDQKLS0tIGEvc2NyaXB0cy9NYWtlZmlsZS5tb2RpbnN0CisrKyBiL3Njcmlw
dHMvTWFrZWZpbGUubW9kaW5zdApAQCAtMTQ2LDcgKzE0Niw3IEBAIHF1aWV0X2NtZF9nemlwID0g
R1pJUCAgICAkQAogcXVpZXRfY21kX3h6ID0gWFogICAgICAkQAogICAgICAgY21kX3h6ID0gJChY
WikgLS1jaGVjaz1jcmMzMiAtLWx6bWEyPWRpY3Q9MU1pQiAtZiAkPAogcXVpZXRfY21kX3pzdGQg
PSBaU1REICAgICRACi0gICAgICBjbWRfenN0ZCA9ICQoWlNURCkgLVQwIC0tcm0gLWYgLXEgJDwK
KyAgICAgIGNtZF96c3RkID0gJChaU1REKSAtVDAgLTE5IC0tcm0gLWYgLXEgJDwKIAogJChkc3Qp
LyUua28uZ3o6ICQoZHN0KS8lLmtvIEZPUkNFCiAJJChjYWxsIGNtZCxnemlwKQotLSAKMi40NS4y
Cgo=
--000000000000e50840061ed39293--

