Return-Path: <linux-kbuild+bounces-7608-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A51AE29CB
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 17:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB18C7A70CC
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 15:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D88821171D;
	Sat, 21 Jun 2025 15:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hE6C33UC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C696F101EE;
	Sat, 21 Jun 2025 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750519265; cv=none; b=oeKRUwPMttTTsSEv2icdpd9IZtCP58VGXQxWkuqy2clWBWf2GUV7OBN4DWc3VTwu9WxnFhlPr//aXTwmfb2VvjBUNOtYPlavrnPev41TahL8PA3J851IJ+Ijmebm6flYEZvX9+LvcPoemCAEL2c7BLX/9bN7QZRLW8tIgOT5bTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750519265; c=relaxed/simple;
	bh=JroJlkuo3LEOnGb3aGB2QIHQjVZIx4hFM1GZ7mqINXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYKWn1ntGLnjgR3LIIiaHwWCjtWcfgUAlO3iuql97GJ6qdCOB0zKHSKsv9VPZ8IQ70cDW1zAzTFTleFo5UOiNJLpu9QCFdZ7jN6fey6yheafVfR3EmcF8gJ+5LmVIsClVeauOvoE09dxfnGXR9Izt66d6Pc6DSGeTiWuzPbeRMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hE6C33UC; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b2700de85d0so492437a12.2;
        Sat, 21 Jun 2025 08:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750519263; x=1751124063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JroJlkuo3LEOnGb3aGB2QIHQjVZIx4hFM1GZ7mqINXY=;
        b=hE6C33UCnri0RizsmW+/LTPeVrx2VbxmiOtONdC0y6ch+BY9V4VRJga0IIqMhzLBaO
         NKGEF99bH7C11QrDtycpV17jeBCGF05FUPKXRtkuWkA/uCIZjGlZoEmrPDX2bThDfy2h
         MWjRCe3VbQrm+gtM43KBVFvDyCh4v3bvt1p0dGDI1uZLEoNTzYtCzpA+2aXl4ODhVCGC
         2GNany2tJzN1C08Rv3vSEXfLi3VgVz9AXY/2sYFx8EBNu0ckK5Hc491CQ/12nbH0zTi7
         ZhCKBKjiNZyHtCx7AiW7A13TroInhQ3NcHXw9qRh3WIBMUZA9qEuQDBJaz4s9hrizVCi
         zTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750519263; x=1751124063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JroJlkuo3LEOnGb3aGB2QIHQjVZIx4hFM1GZ7mqINXY=;
        b=dETYHR3isNX9V4UL8OXsbULqAaMJa0L25syC80TfNcgXXY3KUYWpig2QrBVvD53UQh
         kR97cWwTzpY9uZ0IegEvGXIgVS798IfSxcHs1nTBFM1vOmyLoPiCchl/zgcyahYEqSC9
         pC/POhku7/fqcRri/khH2M7fZP72QVDEu1pJNVNZvsUR75bFiQBkPE6Jl6jwHoBDhuKP
         gXq8EPDK7WGqIrw2ZyD3d8rPYx4nLYBSiMxHXUi3hpiPPK9O1krNUjURMdotfzg1Yx/c
         h1e54xBoYsjgHIoBaWvBIKXAZ0ytLqSNLnGByHGbzZwIeMeH8za7mq5N/I9+z7aSP7Lk
         Z+9A==
X-Forwarded-Encrypted: i=1; AJvYcCUQLVAsEDpaLRzj8NlDe9brCyFrsQUfRlnILBv7myotNzh8VZ4Uh/2aUgJ4XnyJe7hP+5gx49umi9VJA3JjtA==@vger.kernel.org, AJvYcCUegf/YQPfNUnPVSdrSnk0IyepwsegQwZlU2A56pTHFnU5sQdCb/C5CJ2KuPEx5wDkNksN2JA47XdbzbBc=@vger.kernel.org, AJvYcCWj5CUW/Zks8rZ/qeLTdWydiZLwkmrtK1VPK3ZvcNaa9PjfPnytOvQgcMUeOb2jYEwtrVM1k08V64UMS5IA@vger.kernel.org, AJvYcCXiLtRfkRNK5pkux3rwFehBCE5bGm2YDD+y/w3EH3Vaukk6a/YLZpfv88jO0hNsLM42Tm3fLV1Ke8B4pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXIp62F/5rOkGr4VHfA7PCMeWkTDj1+vZeIzVeBu6QyFPsFae0
	mjZF/K55Irck2T5qDE5AH3z7oFj1c9xKr8ME41zA9IYwAYb1cx4F3ASwCVscLpgBvpvMaaldcaY
	UdCxUgeOIW3EiMLGFPpV8BHZ7hLMF5JU=
X-Gm-Gg: ASbGncvkfMBPiy9WMSm0uymaug7zL3URv6BLK/sJynIMuewhAsrYSWtuUMP7hUPBITI
	h0t4wDAD02zQRGaqizcxL9o+oAkrKtI97H2LBjn5NcR0P3ZM/O9Cuw/k7Hi0bjW2lt15Q9wtRfb
	fTg5V+5abI9YLHC1SbU1aitRCdumAXarcJWn+hPdYMCKE=
X-Google-Smtp-Source: AGHT+IEqJJ0jiqUgppcuTUoCFeTLTOefLevfVhkZ3AnKg/JwHW+l7uzSplwtqftwTmPlghZqIoDwqspmO4gvPqbpOTE=
X-Received: by 2002:a17:90b:4b49:b0:313:151a:8653 with SMTP id
 98e67ed59e1d1-3159d9152abmr3676608a91.8.1750519263003; Sat, 21 Jun 2025
 08:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750511018.git.legion@kernel.org> <6e2f70b07a710e761eb68d089d96cee7b27bb2d5.1750511018.git.legion@kernel.org>
In-Reply-To: <6e2f70b07a710e761eb68d089d96cee7b27bb2d5.1750511018.git.legion@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Jun 2025 17:20:49 +0200
X-Gm-Features: Ac12FXyUUusE04-VI0Jbem7xB-mpUmVLWcavnYAiHbpPmDRMU-Iciw-FoK4G0YA
Message-ID: <CANiq72k+ojA3=JfwhvjZ_=+uGBG-WmhLOigzPUXdoY8VQXbf=A@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] modpost: Add modname to mod_device_table alias
To: Alexey Gladkov <legion@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 3:57=E2=80=AFPM Alexey Gladkov <legion@kernel.org> =
wrote:
>
> +/* Format: __mod_device_table__kmod_<modname>__<type>__<name> */

Should we mention that `__kmod_` and `__` will be the search strings,
or otherwise the Rust formatting (i.e. that is carries a line etc.)?

Cc'ing Tomo: do we need an update on `rust/kernel/net/phy.rs`? Should
we factor out the formatting?

Thanks!

Cheers,
Miguel

