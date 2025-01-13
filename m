Return-Path: <linux-kbuild+bounces-5470-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7530AA0BD8F
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 17:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05F7F7A3C27
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B2120AF8C;
	Mon, 13 Jan 2025 16:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KAbWCrG9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290A92297F0
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Jan 2025 16:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736785793; cv=none; b=VFiSnwBgjZE4XLBMly2OPBqCJRV6cpEoNlj0Znb8gl65ZlmZOOWbif7HIc5ZAxeDk9nm56AiAhqJTxc7Gp6b+oQjx0Q3G0Ya70N9DXZlW/AmWFp0DeOPG4W/ym9hWD3XXpXwYgsQjnKI4Tvjehh2Ghe1RnRUphJR1/y3e6LmiEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736785793; c=relaxed/simple;
	bh=FJcbvys8aZYwOSJt0Zuu+MvAf+z2ENwlELthMAUK+Mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pBEEgXMsghQi36kvpbHnuCKd+if+F92lFnSTHm11SDRCs9qj4XMdNw2AYAbaUXKk1kmC+Iok3d/6rNjh8aPGMzTEsfzw1Fze2U/jarNjPWfw297f8swcuGlvj0AJbk1PO/bdFLN+TJ8UeKATSvot2ukyi+GnxLeeVQ9M/7GaZkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KAbWCrG9; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4678c9310afso379741cf.1
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Jan 2025 08:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736785791; x=1737390591; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FJcbvys8aZYwOSJt0Zuu+MvAf+z2ENwlELthMAUK+Mk=;
        b=KAbWCrG9b+d9OxbhZk6sWrnItDAdBogEM6KF5XXrd63JsCbggFy3uBrNgP3Zs6HgYC
         Fx0oWCiUJSW+hcxBcmymiezcEF8T2dvt1N1t0A2k4aBkgsf6fOOZC1T/JSYSY4Krxwbe
         f/5TGoK43sJZuWvNHIby+iquwTqyssCVEjfrZfjThXDg5QYif8t+gH8tpGRFwh1X4jcH
         f7avQq4k7IaLnp674QxdaiAddt5DXVztc5xjb7BL5hQdukgz97hhVQdNSWd9krsiJ/t2
         N5j64XHGTXs6WOMsnTJkRL93p78yLfCaSZT1rfxihF/jDfDYdhgDwXVblozCfqc/hgFI
         jANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736785791; x=1737390591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJcbvys8aZYwOSJt0Zuu+MvAf+z2ENwlELthMAUK+Mk=;
        b=w38I7UCaXPOoE2Ig+2QebRGxx968Da8tU+sKvBXrJ4tRgaGnsTfQrlsbrMUzo8tj1K
         2KxOypEWWFyPoiU/ZPXkLyrmqub85gw6H+wqqMilq3jFHRhZ0HaaoyZHGS8nAtCQ7KSi
         ubsiRaVMlBQFrPSkXS87uJ5SEVpNJ4OTZKwm+6U4MB7ukzfnd3DgMkarBO0wNsCUcVis
         r6kJZV2YtR1tyx9uD81vr2v5B7NnsqrVmiOk2mZeONw/nAzDg+jdqHXu5wnq9bXTO9Ii
         USRDT0iEc5ivBLiTwRam0llHezkxlN5UOzhUAqmqF+iJzYGI34zPNNswMgXBGQ0SHzgM
         UfLA==
X-Forwarded-Encrypted: i=1; AJvYcCUP20yWaEX6Qs03PD6vnnHdRmqAWth65DiNfFDZ+dI1N8lS4Jc66juC6Uh+JWvKcEEdnKSRv472sMyszDM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+viWvmxleCpFA3su/+VBl9NKOFaU1LSjt0ihizIW0y5kcuRue
	rAxcMVYOSoT3TFuuMjRFti2w9LJr4K0gW5XXZavzy1rDjsKKav40+ZoXBA+UOs4Rthx3cT4fNjZ
	o3g18EJyAmq9pvwaZI2ktXUvJg0OOkIuP3dZ5
X-Gm-Gg: ASbGncuPsVTJ6D/OgZl4nAzZmQnitawzLjTafsfmmYB1zdFf6T4lAtyHkYesTxscxnH
	9yNFwL14tsKUY/gCcmNhXLllvW5oqWs6HPl/OpEP5E+Rqaquv0f5ZfDAafDJCAOkalYFc
X-Google-Smtp-Source: AGHT+IGE5s378pBHwC/a560UBUTxnuoY6byJkKpN744uaA+rTIw+UpjLvzpnYKG5s5Oao6RoQjYKujGhkqMena0x/WM=
X-Received: by 2002:ac8:7f54:0:b0:46c:70b1:c5e4 with SMTP id
 d75a77b69052e-46c89d3a757mr12352621cf.3.1736785790800; Mon, 13 Jan 2025
 08:29:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028034949.95322-1-ole0811sch@gmail.com> <20250109132817.1426138-1-jackmanb@google.com>
 <Z4FxyuF-Lnqa4Wl_@bombadil.infradead.org>
In-Reply-To: <Z4FxyuF-Lnqa4Wl_@bombadil.infradead.org>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 13 Jan 2025 17:29:39 +0100
X-Gm-Features: AbW1kvaLL7SLOI4-TcOwbilQxDdQ6m8VV_bHz3Zxs4BHPjSYCbRr_IK5gswNOlA
Message-ID: <CA+i-1C0HUE2+TmMMthRv1MCSQg4SX-+oZao9-4M3rKg71oA-5A@mail.gmail.com>
Subject: Re: [PATCH v6 01/11] kconfig: Add PicoSAT interface
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: ole0811sch@gmail.com, deltaone@debian.org, jan.sollmann@rub.de, 
	jude.gyimah@rub.de, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	nicolas@fjasle.eu, thorsten.berger@rub.de
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jan 2025 at 20:15, Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Thu, Jan 09, 2025 at 01:28:17PM +0000, Brendan Jackman wrote:
> > Would it be easy enough to provide this support as a standalone binary that can
> > be called from scripts/config too?
>
> I suspect this begs more the question of how could this be useful
> outside of xconfig.

I was thinking of something like like this:

$ scripts/sat_config --interactive --enable KVM_AMD

This would then prompt the user with a range of solutions for getting
KVM_AMD enabled.

Then there might be an "I'm feeling lucky" variant like:

$ scripts/sat_config --first-solution --enable KVM_AMD

Where instead of prompting the user it just picks some arbitrary or
"minimal" set of changes that leads to KVM_AMD being enabled.

> But one step at a time, this can be done *after*
> this initial patch set gets merged,

Totally, please consider this a "yes, and" not a "but".

