Return-Path: <linux-kbuild+bounces-8284-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B67B1A52C
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Aug 2025 16:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D0A17A50B5
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Aug 2025 14:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E99272E60;
	Mon,  4 Aug 2025 14:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwAAIPP5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DE3273803
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Aug 2025 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754318635; cv=none; b=PQQLzYzkQgLoVkrF9SGcgUTH/ImDQ8I6XmNOEysZ42IihMfcalrUqb6o/kJyEI/gVGyQ05qqDbWFwXTaZi+cSDFXTJeE01PdklysaT79mNc5GDqAmfnKw/2xS5Zn+xRnsvZGBUCZnMv2WgR31QN+LTqXEHW7k2yM5G2XMNdEK9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754318635; c=relaxed/simple;
	bh=pi4wcByzxhgpQyYWhmQe234j4397jdZNy/GiV//pq84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELowt1LlwZ8TI+Vnoo7YLkAUMd1mXsZlLMzpbLnh9GkAdBWQVvMc3msqjSgHJ6i4uYATCR3QY17eJo+smEY3S3YzCOLcc0ARzGdWBThkYt8+xuo3zME5uf3+3mXaE95rmO+ltIdHfCx4RrBXrkodrd/9yaO0trdY8eZxuEouZdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwAAIPP5; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-31ec2ac984eso785369a91.1
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Aug 2025 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754318632; x=1754923432; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pi4wcByzxhgpQyYWhmQe234j4397jdZNy/GiV//pq84=;
        b=JwAAIPP5yB3SIIRPEkUGK5w8+goqrrMvCQiJOoZnsD+B4KPvxqtct71NQ+xggieWnz
         /PK5ld3dmZNYW/feiL6uMy/jCogJjIYKs30tWDtvaJBOLs4rxd29cKLM1Dldm+EolhPP
         iZx9puxuwE6n7W3vGW4SEdiNTsPSKeKos9BDPM9ObqoTZnc9YFLRPCr9xaSoHPvxjC9p
         woUn0tGdu+5D8n080qp9ROVFlJZI6MOXFmeENAtJVTJQdEltMgXDIK0i4vB7ximEPUiK
         kvQnZ6/ZowrbCFWY9ONapydOtqd+rpWGzkGKZyJ97KcXKGdAZXdnr5Vz+TkBYOeJmghA
         B/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754318632; x=1754923432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pi4wcByzxhgpQyYWhmQe234j4397jdZNy/GiV//pq84=;
        b=bXjFhWV22sRiOUuhpfI4ORsGJuZ/Tl8No/9autRjByrrAjr2JITPun1MvYjwmCeRin
         QpYJfSStyiW4FfNBjkHcm3a2Ef36lQ9t6LZ4knpBhfurT60PssC/qP4xQgkw1WzoEhVa
         fxB5Z6M+cQg9OR3VDjQfSkSObX7TL1jbuVM/LXVmwi511W91X3r4Vf8hA9MyC5ie+nCX
         2eoa8PSMAirnr9b34210sZRazmZIkJbid+4UkLB/h0SWGm+Uww9CXHtnPsK3Jm+IfGLH
         sHi+2emgNMtfvm13XU7pzm1pgc4KTsC6rVDI5PRDDO9zXG6LrdiZJMEtSYv0sU3YqiZ5
         60uw==
X-Gm-Message-State: AOJu0YysCSSBaSp322LiVkgE5UjOEQ9MFegsuYwn4F/l47ERD8fTQkcy
	z6R/ZsGMVeNxF+WADTEXryazSiAic8EbfRgsSbqcVddjj3T0xDdxVuaLykIo/egOJK3vegdoQds
	W1fWfZUb54mefeMBFgtJkZ1/dFile6Gkxen8U
X-Gm-Gg: ASbGnct/BX/ikDOa5J1qACA0ppCWTVIgG3T7BbBlwnOGU7g4pARASFcwV0vZFDccHLg
	hTHdZ2lx8Pbs7Knhidpj7sPBoD4e5Vm41CBltJ12NO5td+9OGGlccdVQsW6LQV0zFwZ38UeCWaG
	8Jdr/Uauy3LfTUFPRRAnMX0Wa3LtK6IKDMvR3h+NiBOWeYMjG2YB8xooJaf0W/htf86WH84b0gH
	Jg4HuUO
X-Google-Smtp-Source: AGHT+IGhwfjEOMbgknjJUqFisBnCJ+XJoNewcGpoN2ZHfRtdxvY8uu5HKCkI4yCLSllK/LPfqPDPxTuHTw7HBukc57U=
X-Received: by 2002:a17:90b:38cf:b0:31f:3f2d:25ad with SMTP id
 98e67ed59e1d1-321162b5699mr5003524a91.3.1754318632283; Mon, 04 Aug 2025
 07:43:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804142007.776418-1-masahiroy@kernel.org>
In-Reply-To: <20250804142007.776418-1-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 4 Aug 2025 16:43:40 +0200
X-Gm-Features: Ac12FXwfXWby8VeatZCmqry5g1tCqANWmUPhz3OaTb8C7iza_vZO1wy_3pqcQS4
Message-ID: <CANiq72=5DzDYjtnc=5s3WuszD4q5Pq2FOq_56D1+=o+obGY7vQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: hand over Kbuild maintenance
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2025 at 4:35=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> I am having a health issue. I've been pushing myself, telling myself
> 'just a little more,' but feel that it's no longer sustainable for me
> to carry this responsibility long-term. I decided to dump the maintenance
> burden and have more restful time with my family.

Thank you for all you have done (and, personally, for all the help
with the Rust integration).

Please take care.

Cheers,
Miguel

