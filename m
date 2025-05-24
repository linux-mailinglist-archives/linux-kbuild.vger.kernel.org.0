Return-Path: <linux-kbuild+bounces-7250-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED25AC2CC2
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 May 2025 02:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 444E24E5F5A
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 May 2025 00:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76EA2167DB7;
	Sat, 24 May 2025 00:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y8zr+2VT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EA4AD23
	for <linux-kbuild@vger.kernel.org>; Sat, 24 May 2025 00:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748046943; cv=none; b=exh2dqnUDmggqFewqnpGfCRZifYQAcIRKUH4vHsujKtJMNFgRh4WxcEqlC+KvZH+ntV8fCgFU3OanBsK1BkA3CQnNgru1DKsjv6cvw8p18l3161B0sdSa5QzPR9RpvdwxDzRB+PxAkx+DOzAnIkMWAsYhtA8ckKPhjBhxwYhTiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748046943; c=relaxed/simple;
	bh=zYGyIK9NVY/25bRw2E3+fN76lGbRzZz30IN/ZoYMvIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUxKVbpNjReyz7ModBVqosXl3//yRkyZaac1b9zyE+TybhAnNR/QYVMd9r+EilW3rQADBNoRPrlsZfrEs6g10zZOMydiyV+72CS3wnJ6UE5oXIJIPGRMFz2sumPKihbAVFko3OSn70kMO1UO8pLspvaF92eDdnlmrYMLLQThVKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y8zr+2VT; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso57038166b.0
        for <linux-kbuild@vger.kernel.org>; Fri, 23 May 2025 17:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748046940; x=1748651740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0myy5A0H8CZ/tHTIcBrkkpPXZ1U3g2SY6VD7SEMtej0=;
        b=y8zr+2VTlK356YLRKIx/I4w4EB7+dxnZ+tpQSgZlJNJ3w5DyfNzWMFaGc7x+FoZgvA
         y1WxQNfkHpgilOjV5p0O1nyfPSFo1WmVKUxTkpiVsAAL0uBzA7E3d3/9Olx9mPwr+lbP
         Tz0QzrpQ2I1vvFZo3zCi8FGEG7BtWJ+DCmIn5F7OBIetgxu9OMDdk/MQXL4Ggh1YcsmY
         c/WMrxA6F1QVSzSHSz3G5URRTFWp64rg4Jp7HV6nk7r0BgRuqPoyGQb1EiGFe6qf28jN
         oLyfAKz1GSaiDIF6f9kxUQyT3dSll7k9IRbn6VMuPmlJa79zmIj/FoZA6vBBrPq+0Uvc
         YfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748046940; x=1748651740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0myy5A0H8CZ/tHTIcBrkkpPXZ1U3g2SY6VD7SEMtej0=;
        b=tKtpEB96XKpcVN8SwiHOjJziI7nanJn4rJsNPxhlOqaWZ64/PSt1bGxdbpheWvr42N
         kRYb7HdKDKcQyWuGNrfX/NYE92KPsR1lYeG7qhtVuaZdiCRZbWU0XhKROosn1qBuQb4/
         uulyYKR9auUJVFJpNSrw721WzkVzKbtcMHrnhJNP71F7OFrrf+Gh5cncLyAWfjqtpaPt
         EDXbwFqhfa3PVpgdDmMRx/BbrJCpmHYQ4kScPjl7ZSiEcivxZGUZMeEo8ncxrq2CTToA
         IOSpCLpbN8bhDFFoLoey+Dz8UPLMZeM2nTTazw0ApL+lRzKCnOBIFi+PvCy+5nUslHhl
         YY7w==
X-Forwarded-Encrypted: i=1; AJvYcCXpKLSK3QZJB4KnaVPbeuoxgMhCNSOBws7vkzfGT6N1jsmMLsGH9DVNPLnduUMs8SzcIwxiqeHXK0OZ6fE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUFZRekS9wcG8H7T3wxH4va1Xherb811X/bOmhRi89O2DRPfSg
	UhYfz6F1JpkbUdbHEuwTNBc7dt3pPXkES2dfXHIO+IUbwceMco5LHLyBSlb90Wm+4NF8E7eN4r4
	/Twyo1wykyAVvz2JrYvIy0HnNNgRk5c7g+ZhCawM=
X-Gm-Gg: ASbGncvyJdHLTyewDXvI3Sv0wsxg/57PYm46rz+Smq7NeT9NCiyOF/2AJTH6CqpgWnS
	1WAWV5M8zdDqi+vokVJJfoRXWWYFM3FQTHfCzINrBiOM7KlQT832NuDB7aunZYdid1dbXWJMKXJ
	QGVitIrBbaVpfz7hhS2qwNhHO5cWn+NZ0dCSwUlr/hEEijC294uhA=
X-Google-Smtp-Source: AGHT+IH19xqd0tlHmy23sQkbaDTtvVOEjv+V8a3crAU7xcBuKeF+Hm0/MGHLQd7t1JJNK4xgTN2tD4Kxp7eJLOcQxfY=
X-Received: by 2002:a17:907:96a8:b0:ad2:3f1f:7970 with SMTP id
 a640c23a62f3a-ad85b0b290dmr101017666b.2.1748046939805; Fri, 23 May 2025
 17:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGG=3QU5Yi2AfHS_poi8SgmatedRg-X8Ct74FOCJUc9iJNPnhg@mail.gmail.com>
 <2f6201d1-4e18-43ab-aadd-27643d57dab6@infradead.org> <CAGG=3QXQkJ6n0J1gZcgxfEb68NWN2y200ZCuxxDtqPRgWPci=A@mail.gmail.com>
 <998f5987-12ea-4bdc-b86a-35b904a34acf@infradead.org>
In-Reply-To: <998f5987-12ea-4bdc-b86a-35b904a34acf@infradead.org>
From: Bill Wendling <morbo@google.com>
Date: Fri, 23 May 2025 17:35:23 -0700
X-Gm-Features: AX0GCFuR50JfWgLwPLNRmXhPGcsCUrEnP4cdjht7KlfTFEqM79_KuWvZq2WljCs
Message-ID: <CAGG=3QVa6BgdtRknf3zY3tkguC1=FcMvNvz3fM8Ngywp0g_aRg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: check for a NULL pointer before access
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 4:48=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
> On 5/23/25 3:56 PM, Bill Wendling wrote:
> > On Thu, May 22, 2025 at 5:16=E2=80=AFPM Randy Dunlap <rdunlap@infradead=
.org> wrote:
> >>
> >> Hi,
> >>
> >> On 5/22/25 5:07 PM, Bill Wendling wrote:
> >>> The call to 'prop_get_symbol' may return NULL in some cases. The if-t=
hen
> >>> statement accesses the returned value without checking if it's
> >>> non-NULL. After inlining, the compiler may treat the conditional as
> >>> 'undefined behavior', which the compiler may take the opportunity to =
do
> >>> whatever it wants with the UB path. This patch simply adds a check to
> >>> ensure that 'def_sym' is non-NULL to avoid this behavior.
> >>>
> >>> Signed-off-by: Bill Wendling <morbo@google.com>
> >>> ---
> >>> Cc: Masahiro Yamada <masahiroy@kernel.org>
> >>> Cc: linux-kbuild@vger.kernel.org
> >>> Cc: linux-kernel@vger.kernel.org
> >>> ---
> >>>  scripts/kconfig/symbol.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> >>> index d57f8cbba291..9c5068225328 100644
> >>> --- a/scripts/kconfig/symbol.c
> >>> +++ b/scripts/kconfig/symbol.c
> >>> @@ -272,7 +272,7 @@ struct symbol *sym_choice_default(struct menu *ch=
oice)
> >>>   if (prop->visible.tri =3D=3D no)
> >>>   continue;
> >>>   def_sym =3D prop_get_symbol(prop);
> >>> - if (def_sym->visible !=3D no)
> >>> + if (def_sym && def_sym->visible !=3D no)
> >>>   return def_sym;
> >>>   }
> >>>
> >>
> >> The patch is missing the source file's indentation.
> >> (spaces/tabs are lost)
> >>
> > Crud! My mailer borked. I sent v2 and it looks to have kept the whitesp=
aces.
>
> I don't think v2 worked either.
> See  https://lore.kernel.org/linux-kbuild/CAGG=3D3QXQkJ6n0J1gZcgxfEb68NWN=
2y200ZCuxxDtqPRgWPci=3DA@mail.gmail.com/T/#mf64c7afd19235d3dee4e572f96ff769=
36f921c6e
>
Goddamnit! I'll try again...

-bw

