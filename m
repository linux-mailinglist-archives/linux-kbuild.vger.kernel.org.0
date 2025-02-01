Return-Path: <linux-kbuild+bounces-5599-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CC3A24BC7
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Feb 2025 21:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8769B7A1875
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Feb 2025 20:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2CD1CDFA7;
	Sat,  1 Feb 2025 20:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VSlccj4z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FFF1C5D73
	for <linux-kbuild@vger.kernel.org>; Sat,  1 Feb 2025 20:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738440623; cv=none; b=kHCnCzNekgGVc/2B/Ns6SiH3EYeuPpISRuiRAxx7IvfQkgx1GQdrQwXOx3yHF5PuoJ9ZAo4c2qnV6zHEPksg5vJP7CldAovWT0gC/KrR8KG4VF+VZzqj/Pu5G5ga4YRcB8z6U7e06lsxigc1j0jzEfYEUZ7cq1FLUibdMmDnbb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738440623; c=relaxed/simple;
	bh=dwKZ9e6C8H5YVBM0MWljIbNoLbFovSt/j2W45tqojAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xajk4tIIW6OdteDtv2sA3opihvKr++WpFfdcBCWUYlMXw9PYwDGSsjazzezRskBB23WgHA6gDuQgWu4dLwoG0T6AtVC1A6UUEPqL8R6LEY8JTt2h6hCy9P6kSkJoiZUrVE3Pdj5kEK2EwPQDrGNtDypwoWHi/TkJYQ8RFqiu5+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VSlccj4z; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab6f636d821so424576666b.1
        for <linux-kbuild@vger.kernel.org>; Sat, 01 Feb 2025 12:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738440620; x=1739045420; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m7/IZGOLu+lbC+EOSNvACW6MUOzlKWZfo7umiRgi7s4=;
        b=VSlccj4z/C706xU8CWl7JgK8PP6JgDfvd78jf5fixRfz37vGezJHHbSF+RS9+BDz+8
         2PzOu/2lM/s4CjX0eUJzWTqDbwuxWD1hEDExW58LNFxDsL6ABaVQ1fSj2IXO8MeYE1I/
         N+NXDgs6RC//3t5ROeokEy8pKA+j2W+e6HLg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738440620; x=1739045420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7/IZGOLu+lbC+EOSNvACW6MUOzlKWZfo7umiRgi7s4=;
        b=ptbjNY4XXzhXhsOIcPXYLWR3oxJMKH0hArVlDwnGUxXUjcxxDdy1PO4i7vorehC96j
         Mt4SAWNn1G8A/U7owPMmjrsAA3zWYP3Q98wHfNIQcl3uMK7nQ99mzkeE0k4nePhqSJR+
         z3JjbXiuYvjU76+MeAelrmKFC8wTVbkFkYKvTYqkE+XnRmbwQELabnuQo4F1joRBC3Q0
         qZ4yAxsREGqxGfQ1q4RwyzHSpW1wrnpcDqZlLc+x01IRyM5pGU3uVM3OureE2jcKZk+E
         Nms5NJDMAFbisVglksnHkTluBu4wBnSwO4ATiKqC7H0mS7uRpTst3oBNkzsXj+g3GXJT
         +bTw==
X-Gm-Message-State: AOJu0YwuVpeHw1gQtBtvCo/TmC6l7exCDxT/1JLelr8CwOM4bXpyVAsh
	tCMjU4dIrSAT0pO31CRuXMyjaleYC4b4aa5bAV1AtDYBRhJnYmWy3WKiOhOikQu5Agesx+9taEs
	oC7A=
X-Gm-Gg: ASbGncv/BPYcojx9jD/oFhVoYdoXgDOlaKPQCmXWiTsQwVcP/Hd/syWmDGCugeV9OZT
	3OUUDhDqNG3uxCggpapmYyhBj0BSd2CR69DL8DIzws+ZgLMFb1o1Zaem5hfus2xvoHP55oc2gCd
	AuO929dxq+JZjAfjHVEy32DnfUG5fccf6g/S+xTvixzCTJ4oeDsP0NtLuXPNUvDO2uCcwixInbJ
	WT2jiUuZQSRyj4EsnwkP22Yt0A+dBuneToNXIV8aLP75OA+RFA5zxwV7M+UIlcS1FpaAaukCtSp
	t7klbOZmHJzm77O75Jl85mFdmccQkDnuBP9xNrl3F+5LPcTcnQawOyBoGw99IRxbSA==
X-Google-Smtp-Source: AGHT+IEEDi4Ix6D2FzRIBPEy9tDWbXerx0IvE84Qd2HX3nJ+S4/tsBBcbyCLAUfbQQpooB6WHY1fCA==
X-Received: by 2002:a17:907:3d8d:b0:aa6:9503:aa73 with SMTP id a640c23a62f3a-ab6cfdc5f5cmr1978280066b.51.1738440619853;
        Sat, 01 Feb 2025 12:10:19 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a562e7sm473477966b.167.2025.02.01.12.10.17
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 12:10:19 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dc7425ec5fso5893564a12.0
        for <linux-kbuild@vger.kernel.org>; Sat, 01 Feb 2025 12:10:17 -0800 (PST)
X-Received: by 2002:a05:6402:270a:b0:5db:d9ac:b302 with SMTP id
 4fb4d7f45d1cf-5dc5effb6c9mr16000184a12.32.1738440616999; Sat, 01 Feb 2025
 12:10:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201185143.1745708-1-masahiroy@kernel.org>
In-Reply-To: <20250201185143.1745708-1-masahiroy@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 1 Feb 2025 12:10:00 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiWTPjGk5BDUu-49LeTAr21qurcv9BnjmrYi=ZqbFfufg@mail.gmail.com>
X-Gm-Features: AWEUYZlBdDHAj8QtpERwR2LQThxWjeLDU2DywKdmKDGbnm9LYxABBIuPfrICgqA
Message-ID: <CAHk-=wiWTPjGk5BDUu-49LeTAr21qurcv9BnjmrYi=ZqbFfufg@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: keep symbols for symbol_get() even with CONFIG_TRIM_UNUSED_KSYMS
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Gomez <da.gomez@samsung.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Feb 2025 at 10:51, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This commit addresses the issue by leveraging modpost. Symbol names
> passed to symbol_get() are recorded in the special .no_trim_symbol
> section, which is then parsed by modpost to forcibly keep such symbols.
> The .no_trim_symbol section is discarded by the linker scripts, so there
> is no impact on the size of the final vmlinux or modules.

LGTM. And I still assume that I'll just get it in some future kbuild fixes pull.

          Linus

