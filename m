Return-Path: <linux-kbuild+bounces-7611-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9201CAE3584
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 08:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD7EA3A2B45
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 06:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47771DE3DF;
	Mon, 23 Jun 2025 06:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvsSNhaB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F4342A9B;
	Mon, 23 Jun 2025 06:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750659314; cv=none; b=ZImQIF42C8KzgpFC73buWn7nrXDD3XQ/m3o7mq7DayzYKAsrZtH1wfc6vL/xlC5Yb8v1DTLXtweS5cF9RXqiWnpnAT2CpEZwdn1x9pelJPss0BG68U7UCRwXwNWxkzzf2kxEV/k+UaUuooez5b++FffbKs6ItE66MgAR5iEKTWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750659314; c=relaxed/simple;
	bh=AcYu/WVYvsn36cfPteGR9OZKsctu8HOzLHkwWSywLOw=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ELZE+EW2EXD/sNAgYHH3/NTQtxPQ5P8gZbbGVfIB88lW3f9QIHBuzzGhxm9H2Mixpf0uJ109Ji/fGdlZr7y2VkVK/aWgvytmVrDRlIdzWWci9JtAMod4b5RP0FfAjQuXMZManG0g0DRD4lFQxj8jP+R9ReUe0G15cipnIogYAoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvsSNhaB; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-748ece799bdso2489185b3a.1;
        Sun, 22 Jun 2025 23:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750659312; x=1751264112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcYu/WVYvsn36cfPteGR9OZKsctu8HOzLHkwWSywLOw=;
        b=YvsSNhaB3RAASNr+mRDbKzMdQVAFUF5if38T+PNUY3syJKdPkAgKDMGgX1RIQL1KkP
         9C5mJmc1zWiaZdmi/mURwCiRJnBHbBoWwu9KZA9x/anrlaPqZOHKyHs8NGTeY6JB8D4u
         +lGv5OW9BuMgebP8kQDZC2djIrGvVUHo5dey/hVCjuZErqjVMRSX7XW3DDLjCOZN82LS
         kbrDYv8ASgTHDR5vaEzliuhSv+hw8OGURJS1eUQkePu6tctkb8TaHV4kqpeGeaxwMFeN
         Xhq4DGa3a/s/OFu7f75acEtxWM3heyOjkP8cd5b0j9b7Ne6+TwKvvkuEKA/jJ260YiDU
         SXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750659312; x=1751264112;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AcYu/WVYvsn36cfPteGR9OZKsctu8HOzLHkwWSywLOw=;
        b=IVWivV1wvJgumB6RQkoZ/2XF0VrDzqcSCT7d7pr3bx5G57jd2OKfA5EV4C1AhDYwaA
         ZLoumILcLjbmzEWX/NGgxdn01Lv3JMiO9TEdu+5bkrnbwunrm+of3cxUyeQH6Vfec6ie
         FkcPfPxLmIRccgXDscMi+0FKaQNaVxOFwZgLgIIa+CGJG8Am3iDZLXVQbP9jqCaKtJNl
         fL8CWX4B+QSIaCL/dZTyzgC2G/wJ712uV5ndJ6ODP25hNP80l6bYAssRUkH1AnsSsrD5
         aDemmqszHoKuCksYNAAIBPvija9+PAP3eMFL+tujouw5l6+89WGPSwF6IGDRcSOKOJ2E
         FqSg==
X-Forwarded-Encrypted: i=1; AJvYcCV4lHz7d7fgGLDucIQm26UXTc7b6XUUXqNKRFSyRt/K+DvE4NQSOygIUYkQ0h9zdvusbKC7xfx1+KSBUI/f7A==@vger.kernel.org, AJvYcCVrx8b2h/CW8fRVpE0C9hVmvXnslaoDemNOn0yQKZ8w9tivWQEv8co/cFMlyaBm5pw94StRE3h7wF7fMvxFZrk=@vger.kernel.org, AJvYcCW7lyGnyprPOnvlu0oLeVQ3BuBj+BkdtvHTW/PMAf8gLsCpvvdQWYCCKuzArvIb6pBiaWbiCT/Y03Yu3A==@vger.kernel.org, AJvYcCWZdnNbewC5CDTr4M0rzsMgyX2LI/BnjNBKoVcxsfJ4skcPGiNNfT+lNEnlDTPw2HUlGsbYUPPPsVW2Jw8e@vger.kernel.org, AJvYcCXZ6fhMfWf87hXx0lnYu/EeeUqSVb3lPPqExqib7G+4Rzo2e+asj66PSZMF8HMqCsznnWNXos7oMYedpSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgUKBo16cNeVRQRyzRZfJGubt8WS/4oZqwYcPOpxz9si1WAaYC
	qbMFo1PIbn2OqlRrTK9gB1YpYF9J88oxumWqXvlwFLTLk/VDXusQ0oyv
X-Gm-Gg: ASbGncuHWeyW3JoaHqvSJuBJAGwcH37jFT8PUsdmVzjz6I2aMV2TmG41Zqrw0J3jXk0
	Yuj9kqSLoVnj0U5VIZd/iB0sxg+Erhg1bhdjRi2r8lwuFFTU9mLHkdVuN5c/WyDQ8BO2fhkIcl6
	OLmZcfTUbFFNgu1SIBVz9dtGSJa4P1QKhANhKP64JAGv/3Sn72ipr139UlhvoMcRxuXVLo9nzZf
	eq+lTOcQ6Z0lswCuWjUKcmKPTR9+W93ZRutavTY0cOtHgBEsZM9azQr9dW54PLSSjcTxgUdne8t
	XndCh8DTyc3GyL50N4t6VxN45aSwVqVw6uzqsHXGiRleObYtSofEaOQKo4ASes1u3dpnw/5+cs9
	dW58MlymTEeM1o6KzkjiWCaV2jEOl2hGlmSnn8dAS
X-Google-Smtp-Source: AGHT+IHY9X//o+R2PssqzJ/pkHya9V7VcFnig5Y//0KhTUiac6/Fr3ZTrRaVNsJvHIu9hPJWWPUMEw==
X-Received: by 2002:aa7:8882:0:b0:748:3485:b99d with SMTP id d2e1a72fcca58-7490d7acd50mr17534133b3a.18.1750659312548;
        Sun, 22 Jun 2025 23:15:12 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a628108sm7417019b3a.102.2025.06.22.23.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 23:15:12 -0700 (PDT)
Date: Mon, 23 Jun 2025 15:15:06 +0900 (JST)
Message-Id: <20250623.151506.234375373177079205.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: legion@kernel.org, fujita.tomonori@gmail.com, masahiroy@kernel.org,
 petr.pavlu@suse.com, mcgrof@kernel.org, samitolvanen@google.com,
 da.gomez@samsung.com, nathan@kernel.org, nicolas.schier@linux.dev,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-scsi@vger.kernel.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, gregkh@linuxfoundation.org,
 rafael@kernel.org, dakr@kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 6/7] modpost: Add modname to mod_device_table alias
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72k+ojA3=JfwhvjZ_=+uGBG-WmhLOigzPUXdoY8VQXbf=A@mail.gmail.com>
References: <cover.1750511018.git.legion@kernel.org>
	<6e2f70b07a710e761eb68d089d96cee7b27bb2d5.1750511018.git.legion@kernel.org>
	<CANiq72k+ojA3=JfwhvjZ_=+uGBG-WmhLOigzPUXdoY8VQXbf=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gU2F0LCAyMSBKdW4gMjAyNSAxNzoyMDo0OSArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBTYXQsIEp1biAyMSwgMjAy
NSBhdCAzOjU34oCvUE0gQWxleGV5IEdsYWRrb3YgPGxlZ2lvbkBrZXJuZWwub3JnPiB3cm90ZToN
Cj4+DQo+PiArLyogRm9ybWF0OiBfX21vZF9kZXZpY2VfdGFibGVfX2ttb2RfPG1vZG5hbWU+X188
dHlwZT5fXzxuYW1lPiAqLw0KPiANCj4gU2hvdWxkIHdlIG1lbnRpb24gdGhhdCBgX19rbW9kX2Ag
YW5kIGBfX2Agd2lsbCBiZSB0aGUgc2VhcmNoIHN0cmluZ3MsDQo+IG9yIG90aGVyd2lzZSB0aGUg
UnVzdCBmb3JtYXR0aW5nIChpLmUuIHRoYXQgaXMgY2FycmllcyBhIGxpbmUgZXRjLik/DQo+IA0K
PiBDYydpbmcgVG9tbzogZG8gd2UgbmVlZCBhbiB1cGRhdGUgb24gYHJ1c3Qva2VybmVsL25ldC9w
aHkucnNgPyBTaG91bGQNCj4gd2UgZmFjdG9yIG91dCB0aGUgZm9ybWF0dGluZz8NCg0KWWVhaCwg
bG9va3MgbGlrZSB0aGUgdXBkYXRlIGlzIG5lY2Vzc2FyeS4gVGhhbmtzIGZvciB0aGUgaGVhZHMt
dXAuDQoNCkkndmUganVzdCBzZW5kIGEgcGF0Y2hzZXQgdG8gY29udmVydCB0aGUgUEhZIGFic3Ry
YWN0aW9ucyB0byB1c2UNCmRldmljZV9pZCBjcmF0ZToNCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGttbC8yMDI1MDYyMzA2MDk1MS4xMTg1NjQtMS1mdWppdGEudG9tb25vcmlAZ21haWwuY29t
Lw0K

