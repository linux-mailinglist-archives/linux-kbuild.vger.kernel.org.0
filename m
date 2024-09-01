Return-Path: <linux-kbuild+bounces-3303-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C02BE9675FA
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 13:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26959282173
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 11:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDB914EC58;
	Sun,  1 Sep 2024 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtUJXNT4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D0114D718;
	Sun,  1 Sep 2024 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725188429; cv=none; b=EBusPaoU8JI93iIT0xVYC2DvYTA0bA3uCiCojfdGoy0NSnHUYSgXuuVZ97I+26Ejf+4TnomAUEezyUEw1bkgZZo9rF6/tvkh+0qyT1+89ctNImsRQc9Ed1CI/If4a9k1S+D6HGMAfJyYxRH0/bUoRU1XmjBxsFV5jipd2w2XWmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725188429; c=relaxed/simple;
	bh=LeTFiD7OsOSKOY5tNZriGWMFGt4Ydtpr7029oP49zOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kzug/ou3s5qAexAWDW5/HmtufRgHoaGcVY6mEUFTT0XToJ4mT+c7rCGi/srlbGfSLPoKqkXGAzrHMsGQWU1DKkW/Mc4QX7KVZpcn/tjozYxkMy9PKlSZITgmlEE0ktDg4Fu4XP2PIIGFPginzdni+2bidFi6S92ueM4ZT9B5D/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtUJXNT4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3913AC4CEC8;
	Sun,  1 Sep 2024 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725188429;
	bh=LeTFiD7OsOSKOY5tNZriGWMFGt4Ydtpr7029oP49zOY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KtUJXNT4IfClWRitCPRV8frKOdr+FCy2NwFJNhOuEQKtkz94ydYcXW7MC1ONABPst
	 DtvHfEL+WuGU0HZhsT2jF4ivVJKvIeqBTpWD1uWdernfC+92teDJpBq7pjzaxWzsBD
	 N7d7CEhP5ezLkuyIY4++jNtK7yzMI9Ox+Lr3JKuAuDEWTQkUqWObZQERTLOccJAChe
	 JrVkk2E4hTDe+a0FUL/2BqnTWGrIs7RdpL26KRMbf3QGUAJR+vuibyIPvC9Cvioynq
	 qSm2DR/2qlk3Uz/QT8mO9EEutERU0WmkPBapAgCpiXLf6T63LjB4sc19JQ5lbZHCWX
	 ohmwhoJooYFBA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53343bf5eddso4355870e87.1;
        Sun, 01 Sep 2024 04:00:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/5g5pFj489ESuFXOtBI1GUr06Nn4P6T/OEnpBkC1XHHjOUjZ14yzLcEOQYlWOT9Cz+yUUCdcw+ouRdkc=@vger.kernel.org, AJvYcCVXC7YDzotDf0um8kPpCWHxS1Dv1onCAikTzADNhXJuX2HQ8w5ahXMkZTJOjHb9CBrqUq5i2VnAu/NlWjXEjBY=@vger.kernel.org, AJvYcCWGXWLV5zs+ZuFXAArShLE3YNCJj9A6WI57ZXwf1fosXcJivyVcs/M/NifoOMBYHvCjnsjdXFBWORZZg2i8GQ==@vger.kernel.org, AJvYcCWg+scsMJilDz0lwgaLnJBVBD1EjB73rGY54+oNPY7svwv50vWLjf/EFl/t258vQ/gMEnAyupwsQ8iH+0gu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3hd1QP4ZImeQAFj543u5+XPgIy+SgT0xm2pHB8Gw4t0qZ6BS9
	fwfE4/9H2kJo06IpA3lLnTrnum45S6SLR9Fgt3VrGd+fnzT/nF89yUmCmdYkr8T2Cx+i1yHUHCy
	KA8JmPAmfxaUq8H1Qw7ZzYn0QpjM=
X-Google-Smtp-Source: AGHT+IFwfTk8rSZCE5bhyi7dyoJF3hTfQhLuresxtg9B/mFhl8pCS/EGWp3SLBXp0MUjNqxy4EBkLQRbks3wB0kEX3E=
X-Received: by 2002:a05:6512:3350:b0:534:543e:1895 with SMTP id
 2adb3069b0e04-53546bab3damr3474846e87.39.1725188427879; Sun, 01 Sep 2024
 04:00:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com> <20240815173903.4172139-23-samitolvanen@google.com>
In-Reply-To: <20240815173903.4172139-23-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 1 Sep 2024 19:59:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR4BEpehbYtQP3fw1Gt60EmSpzTEj8BijWKNCAi41fyPA@mail.gmail.com>
Message-ID: <CAK7LNAR4BEpehbYtQP3fw1Gt60EmSpzTEj8BijWKNCAi41fyPA@mail.gmail.com>
Subject: Re: [PATCH v2 02/19] gendwarfksyms: Add symbol list handling
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Add support for passing a list of exported symbols to gendwarfksyms
> via stdin and filter out non-exported symbols from the output.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---

>   */
> @@ -40,7 +82,7 @@ int process_die_container(struct state *state, Dwarf_Di=
e *die,
>  }
>
>  /*
> - * Symbol processing
> + * Exported symbol processing
>   */
>  static int process_subprogram(struct state *state, Dwarf_Die *die)
>  {


I also tend to regard this kind comment line change as a noise.



I think you can squash 02/19 into 01/19 because
this tool does not do anything useful at this point.




--=20
Best Regards
Masahiro Yamada

