Return-Path: <linux-kbuild+bounces-9025-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B84BC0108
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 05:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 180E11899E9A
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 03:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6327919D074;
	Tue,  7 Oct 2025 03:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="MqAiJ2JG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1BA1FDE19
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Oct 2025 03:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759806562; cv=none; b=bj2Itf4QnVNq9LVwzzs/Qp2zhGQCsRBe2aK/gO9zxbjdWVZmR5SNpGyAZbCxQUfXNvKef2oxAQQEtpURH722sgaKdFEir13UWO2GNsD17+D1cI9rRPokwyv227sD+TJhaAkWNJDiMgd6jZCoNq9vT+AJv+xoTXiII3Ra9gVYyCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759806562; c=relaxed/simple;
	bh=lZj38OKkx+1/Ld1EteLv/YwogZEZ1ucSGqCfkfqjXDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tfQIJi9Iq1zp08i+UUy/PzvoxqhAsx8i0jfBQkFwLNGQ2MYBd/C0DgFfw8O4Z5ScEkK4UDwPlmz+cBnNyoPr0C6bGYDOdHxC8fRY8b0c9FxIKlAkGZ2IA3KqfhXhvtkhf7A/oCwZU+WS5g+BTBXmNhSEk26mRzaiOvR0gh2eLU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=MqAiJ2JG; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3327f8ed081so6471982a91.1
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Oct 2025 20:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1759806560; x=1760411360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XffbB1BYJQjeKTYwuW/PPDpT+pJqNE/EDu7Sp9DXqac=;
        b=MqAiJ2JGJ8t5kiZiE/7AWmlyErQafFQc/r7GLhS94I85HPvAQXj/n8OAZELhID9V+S
         7v1phECGAZI7KEtkH5iR6qsJv5HyYygSL/Rzz5TuwNMgCIli3ek+xVCn9GQ/DhEur0/r
         pkWaKcPkzCJR+44pEp0vcFNptCdrqogRB1z73k/MsFfJ1KtPOdHAfkHM4+wRzlXRgXur
         h504mkF2/7+Msc2f7A2QzIQpcb/xd6SqDu7HytuFFW+WSwjfpqMoTAltHcYTAFdlA/M2
         p78yy6I8J1/NajwWEDw8d8Ny/padrKckdmCIwVgFERfADKGl8IIkotDvggkWbs+HU2kR
         CrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759806560; x=1760411360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XffbB1BYJQjeKTYwuW/PPDpT+pJqNE/EDu7Sp9DXqac=;
        b=BfN2rbDfsgDI6/Ib1cIbWGveRKNxaugJElGviBGaVjKfuhg5KKzQALKl85SuXQE+cd
         1YXpTWtmty4MlQEYk75uQKb75jvTJSyLFuiBRhVDvNWPfuJAzfcRwsP/dBbP/s4rjsmf
         XKtN9s6aDyrVjqoL3bdVm5BlH9PjGKTAllaBtwMGXFS1aAC6oTzYSSYZPV6JFDx7rH66
         XdeZOPpefpBqdAI3UwYA7WjbDp0zG5fKpZzQSNBR86blvpFNF94V4VUfY2YYX3XX5sP9
         d7mxUtyKokWE13BlUDduzpSqSlD/bg94/nzvHduMPyClLOlVKynPLxI7pdK3olzsX7Pg
         gvgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9NY/EUuURnwj9oDypG6ugY7I+3MLRCOILhEZNhCfmbDMBdOM/vg+M8iuxWYyGd5yYPF95iTx9N6gtWNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgpZhGRfQgWkN1bZeBkbliHTJbXlCuu2nLh1kGGp5A2KlUQ8NI
	m+tTowvRUoDEqlTkNhYz9blFMZCfhKtzDEF+4n5HhSFxrYZ+/cj3VLedsXqGH0SsLn2TV9jTUOi
	0ehyyvQEOFFJLrkiCUia6n/spGjIN70cctoeEGS4xYS7ZVQEUTs08ug==
X-Gm-Gg: ASbGncsjOgHtZTAVjc4P9z28W/UhCV8SndM3wlPgrtwCTaQqVjPKCRwcMy81qYofyah
	OtKfHvxZUTGVw+ZzCvbYOcLNkVJH59J7Yjk7O4QcIC2u3/Y2BoZumMawkTYmy7Vrp/iNWA6IlaJ
	2qHs7y2LcfHV4zyPz5aWgtfXUxktilxSrQMjp6MZXiWhnrNlJjJ2uaCx6w4GjLnOT5wHtFi6Opw
	Br/PC4eKovWctIOJHkS8qnTnDI2G4VIDnvwHLfjyY3CKKd5RqFMZTUcxoZFb0m6qqxkXTHnA5od
	rJls8lcaUue5CWlseJZq+oekQlrk5TpMDiaaL3nROcKM4Q==
X-Google-Smtp-Source: AGHT+IHaIEffMrKfeTcTUgzGHSazsuwuu7lVlCYO+h2WNjR/W3jVRra3F+3+Cw45MDqEiW6xN4uYlma4f96TT98oLxs=
X-Received: by 2002:a17:90b:38cb:b0:336:bfce:13c9 with SMTP id
 98e67ed59e1d1-339c2786cb0mr18172403a91.20.1759806559955; Mon, 06 Oct 2025
 20:09:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007-gen_init_cpio-pipe-v1-1-d782674d4926@arista.com> <20251007121719.45090b21.ddiss@suse.de>
In-Reply-To: <20251007121719.45090b21.ddiss@suse.de>
From: Dmitry Safonov <dima@arista.com>
Date: Tue, 7 Oct 2025 04:09:08 +0100
X-Gm-Features: AS18NWAhAB7vNo7AYIrC-NzBUTjNLPLP1aeLAtk5_788uAbnecrqxdiQZUrf6pE
Message-ID: <CAGrbwDSU+tidGxPUmKpANUTeCE+vEib5uQGG4DQSR9k-RK-WUg@mail.gmail.com>
Subject: Re: [PATCH RFC] gen_init_cpio: Do fsync() only on regular files
To: David Disseldorp <ddiss@suse.de>
Cc: Dmitry Safonov via B4 Relay <devnull+dima.arista.com@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 2:17=E2=80=AFAM David Disseldorp <ddiss@suse.de> wro=
te:
[..]
> The code change looks fine, but the commit message is a bit verbose IMO.
> Please drop the first and last paragraphs. The reproducer could also be
> simplified to e.g.
> echo | usr/gen_init_cpio /dev/stdin > /dev/null

hehe, OK, let me simplify that in v2.

>
> With that:
> Reviewed-by: David Disseldorp <ddiss@suse.de>
>
> > Fixes: ae18b94099b0 ("gen_init_cpio: support -o <output_file> parameter=
")
> > Cc: David Disseldorp <ddiss@suse.de>
> > Cc: Nicolas Schier <nsc@kernel.org>
> > Signed-off-by: Dmitry Safonov <dima@arista.com>
> > ---
[..]
>
> Another option would be to catch the EINVAL error, e.g.
>
> --- a/usr/gen_init_cpio.c
> +++ b/usr/gen_init_cpio.c
> @@ -112,7 +112,10 @@ static int cpio_trailer(void)
>             push_pad(padlen(offset, 512)) < 0)
>                 return -1;
>
> -       return fsync(outfd);
> +       if (fsync(outfd) < 0 && errno !=3D EINVAL)
> +               return -1;
> +
> +       return 0;
>  }
>
> It may be a little portable than isfdtype(), but I don't feel strongly
> either way.

Yeah, maybe worth avoiding breking compilation on some weird set ups,
going to use your version for v2.

Thanks,
           Dmitry

