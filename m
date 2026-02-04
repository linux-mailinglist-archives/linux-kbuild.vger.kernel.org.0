Return-Path: <linux-kbuild+bounces-11027-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMZlMzAKg2k+hAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11027-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 09:58:24 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30117E367B
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 09:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EBB93028EC5
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 08:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED99639A81E;
	Wed,  4 Feb 2026 08:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqB3LJ5R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEFA214A9B
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Feb 2026 08:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770195288; cv=none; b=bOs069FLbNrLT5r+s5ouVVq7U09nbGR2BLzl9TS3qIirJZws+idSb1wlMIJ6+4zeHIbXK46ekxfDVOk0rm0JBTYLuUxD4oIDoDWqZL/dlnBz+rPweeSxJn2/Xy3ltVwTNEu6GW1ModYGLJQxEymByJHI+gL4zVH1VCbHn0s6jzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770195288; c=relaxed/simple;
	bh=R5mja2gOlOuVT8fDcPXItAXnFanLcrP6joW/cVhdHmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+E6KfTSTfBEQroqaouj5g6bXdSpaGR60m6gXYQW4COKUuCJJPsXy5u11kp8UJm4f1pqwDWsE87z6oAoyYGeFfN5IMh5v5uhP+6vDJiEie39BA8vFQ5HkNq4QDogUFnJoeYlIk/3IH39Kb5u9vhgJzPU0KOzPqCkUWFNtj2ExqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqB3LJ5R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630BFC4AF09
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Feb 2026 08:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770195288;
	bh=R5mja2gOlOuVT8fDcPXItAXnFanLcrP6joW/cVhdHmU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UqB3LJ5RY+gb8yYobzTMCcRKbowxzhpkpQ63TRcPp9e1dfSohSISPHetTSrN/+4Hc
	 96pZo65OBHLq7CvO17IQhx5zI+XPpP5GH7hX+oEstSA3ehnuke7MhUd0OUAEWQ2Kky
	 k2WOu3EHagAdGKr7e375B8BiObKFLRMucBKxGxox8GQ+GCvsrKjSwY5UOjX5+iHt3o
	 isDEHhOjiYA/UotE3xEbUBfqVfeJlET4GZLHswlAG5lUhjJVMUHFZtNK01dHMRlPL8
	 F2lv4ROtFv4zj5ziniZMUAYtlQ4kRYh3kM2vTAqhuci2YW+KR1RZI5OVS8/vj2EChc
	 g+a1Tm9reNe0A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38320cd563aso5124721fa.0
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Feb 2026 00:54:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXn61A+Lz26d430RN3Z4A+VkJPw3GyTjQmZNCTxK5Q71bdZ0VkeV2qjsdy45inT1KP7Hfe2C7YxNsPPu2E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzta8HwFU0gL2Wp4J7/9OM4W/jBmQG8JECKMy98n0PchwUDNTrG
	xyrYS0K+hA2jo0o9zLJalqK+mKtEapW1xARrB5jWgbXBKs9ZS+wmMOo/dzpCk0CNdgFe+VHbHYQ
	6L+tMKuLKV6fEEBWixpSf2vYO4QDzAag=
X-Received: by 2002:a05:651c:3259:b0:385:bc69:fc5 with SMTP id
 38308e7fff4ca-38691d5b13emr11291341fa.20.1770195287069; Wed, 04 Feb 2026
 00:54:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
In-Reply-To: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 4 Feb 2026 17:54:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNARZnMdSS-ObiNp1tQt8MX4jZZ3P3ibTjAfD2k1kj+K4NA@mail.gmail.com>
X-Gm-Features: AZwV_QhQ8vM7KUFY025Xp7nVLu32uD8lpcnoPf2_6JLSQ5NS88nXTV9OA9hXL4c
Message-ID: <CAK7LNARZnMdSS-ObiNp1tQt8MX4jZZ3P3ibTjAfD2k1kj+K4NA@mail.gmail.com>
Subject: Re: [PATCH 0/3] scripts/container: Minor fixups suggested by ruff
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Guillaume Tucker <gtucker@gtucker.io>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-11027-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[masahiroy@kernel.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 30117E367B
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 8:27=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi all,
>
> This series fixes a few warnings that I see when running
>
>   $ ruff check --select C4,RUF scripts/container
>
> which were the few warnings from my personal ruff.toml that seemed most
> interesting.
>
> I will apply these on top of the initial scripts/container change.
>
> ---
> Nathan Chancellor (3):
>       scripts/container: Turn runtimes class variable into a tuple
>       scripts/container: Use list comprehension in get_names()
>       scripts/container: Use iterable unpacking for _get_opts()
>
>  scripts/container | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)


scripts/container is written in a generic way.

In my understanding, this runs an arbitrary
command in a container, and that's it.
Nothing is related to Kbuild.

$ scripts/container  -i debian:trixie  echo hello
hello

If this script is really useful,
why don't you keep this outside the kernel code
so that non-kernel developers can use it?


--=20
Best Regards
Masahiro Yamada

