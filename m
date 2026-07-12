Return-Path: <linux-kbuild+bounces-13993-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lhxiGYY1U2pbYwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13993-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Jul 2026 08:34:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A93C1743FE2
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Jul 2026 08:34:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KlCquX5s;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13993-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13993-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B019300DF62
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Jul 2026 06:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD43C1DC98F;
	Sun, 12 Jul 2026 06:34:43 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FC8286A7
	for <linux-kbuild@vger.kernel.org>; Sun, 12 Jul 2026 06:34:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783838083; cv=pass; b=IaZn4StE9ohO24+Lp9PWq3VjPo6UmhN9EUscGHI3RpegW5FYcyLk9BCfzUSuUDgnm4itD87Dy9oddYeS5MjRikiQxjTbyL5YX/aLEl9wFjhVtZtHXo1uBsT7QfwrEGUZTqbGITKM+YcqDzTE3xVVtuZ7dcis+UCwoqlF/A8kNjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783838083; c=relaxed/simple;
	bh=YeCGzZKby0DzGyJ13Wlsi2uw0Y5H81ufmO5agPxkulg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sQJoPSh9BfsjrOn5ywsZuQ4cu2nH8p79dyO1fSGFzVNVgPk0nUFT+kFaFRfum1mVKKrAzHty46Kku4fBrrKy9BCZuBAju4ol80BpOjsYuRvwIcNCRJVoVjKYggGQh+P/ZFJ+bPMDc/mNyVNgdMZUEbAlr1dUkhJYtvTOvd9sWg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlCquX5s; arc=pass smtp.client-ip=209.85.128.179
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81dfdbd86d1so20786187b3.1
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Jul 2026 23:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783838081; cv=none;
        d=google.com; s=arc-20260327;
        b=Vxn7EbzKLbpljzJthrfBNsV506dPiIPUckWZvfW3v20Ci3eF0M2EOh6eDIlRH3nfaz
         vhK1PbxbA5oyuf6nzGf+ZAAD2e0nYChVKxMAv7nz6ek7TedS7YD+ImQRg0nZ13DxtSrj
         onFpn4RphU+1MOUx4NkaFiAwNrlPmj/OMzv9KyDZ+HJAuyXSUHetusbsvqBRBWAzuKp1
         RqPfjW7flRlaMW5Bg/71CulCpgwH8gSohB7MTpY1wB+MScGJJ2+soZYa9siHgB0e2/eO
         nyK78JnK1Ks3dbwin70xeBRQ0OHhTTSo7LGiCGgmipY6ra7v2Oshby7XH+z6z6k3RUu5
         Y7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qKiOMIK/5sZdE3Eul+wowZxaMmUdof2Iuc1X8BqCpOA=;
        fh=COelAdHrFVerGAf7F+1yEUVc68/CFBcbbLYqUAyGB8s=;
        b=Fp1rVyzCz09RCbbtejh8rGdU8afUNUxyjIzlgoPolTd+LyGCAZ0CE4n/1Y9SG4FWI/
         q03fvnulcQeGDIrNAg4T6sR9hi6FhuqpscqanQSzRiJoj1F5kCxqChHUYjz9FLFXSf7A
         9IoG8u9b0rd1tnQcwckRWsFxgN59stCLMCQI4AN7q3ek9HL6zgnKW/SO2Tb5SasiMf3K
         qUgRZZ6ZX4gBKKm1ZCXke6Fj/eFziHYl43VSUxdaWcAYG6KF5wKD16T4zsggYARJrBQe
         Xdb0AOaaSJeor6jp6W1kq1wrdPgIeDOFg92tKSOmWOhv92cdAqT6QF0cHgoX+Du0ZYQx
         Wi2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783838081; x=1784442881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qKiOMIK/5sZdE3Eul+wowZxaMmUdof2Iuc1X8BqCpOA=;
        b=KlCquX5st3ymYKBbOXVk8bSjaryJCGPsg+silkbZyu/TLidoRziew3DrdHFhzI+y7Y
         K79nWASkSe4/Ml0Kv9n+3fB0GGn6Np1YUFPrWex6K8d6GCweSYTdSKNYaPQvsmqSzJcl
         x6HfIpV6sKO9jzb4IuLwlR3ukCAwN0iio4M/nmRqYNbxyZkcZ9u7tAfFRSbw6Fz4mPPo
         Tz+obMZ5oVASpSq7HQXmwbAGjMlHxwe8fERub3DotcSPnG89wEFFLhwOPWWOKMtuXilP
         Zgb5te7NcWy99lOLw1WPfEwBybEXDId1Ugxd1HAgDzOfMvTigKd8FGLk8d47VCmwslPM
         P+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783838081; x=1784442881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKiOMIK/5sZdE3Eul+wowZxaMmUdof2Iuc1X8BqCpOA=;
        b=Z/SHKxNH/VEzMgkmnUnN7ZiPxT8H3Shb5O+cYGaLrDZqA/r543jcrWxFbWBlueApM/
         Ajn1zKRAJ+4WNuD3uI51NQM165oJ9EBGJc7cvOaDwzBg4V4O6tb6GmFMQRecozpYxF9/
         zmnEw5mmMbcviBkUUqwx28WB74uXHqY5duVIkt28RzMSrcAi7tgVBKDAkOwpwnXwBPOn
         A7wVgCVjrLR+jMHpnMhJbZFf+u+3qRH1oQ7NPbq/j7bCjaNpb9le8agJBuLbR4jPJUg3
         yn26+lXiUELDjLoQCol2q1xiASGik9s5kll/NrIncL5cLb5FIpHkFig+jQtlK3U/o192
         2BdQ==
X-Gm-Message-State: AOJu0Yzxj7XZeFZtaVl1+hiKtGxOicgs7ciJWqnJgm3btU2J9A3b0gb/
	EkiKjd1jU+ztJ9ocDCi8VShr9SC0VFNdJIc6C2xh/CkLBdSajsaQuut2PeXTX88UTSSCxX5qUOn
	wDdrg9LDUUlHKBaesh9UFnVlvx9m+8vn9uw6LwZA=
X-Gm-Gg: AfdE7cl4zjP1lzqVPRV2ECYYdQpo9t4hXbPIHW2DbxBN/4Hbt+8reAu6y9g3tmgnZER
	UUu4/Qyy+Lbh41JrXl+5S8B+nLmCr2/Fffm5lLAgBSFuq/Gje42Yke8PIGbLU+B2uk7tQp/fz5a
	ZlRWFS9Z+LFY0ZV0PZq8ZiVmxW7AzMH1rW2PQ7PtwCmBJHkraSQNiTzOOmDqMZma2gyRSTeTos4
	S+slKgiVkEjw0Q/wAK46uHE069SgXETnB6Pimv9omSIuX4flmRPHXW2I2MZiaDLab1jA65cHykQ
	u/f+TtoNopi9o3qP/dGlvCMeeIIAXD+TT2DBNWo6
X-Received: by 2002:a05:690c:6288:b0:80b:e6ac:53dc with SMTP id
 00721157ae682-81e900612bdmr36089167b3.23.1783838081581; Sat, 11 Jul 2026
 23:34:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260712062834.77872-1-laoar.shao@gmail.com> <20260712062834.77872-2-laoar.shao@gmail.com>
In-Reply-To: <20260712062834.77872-2-laoar.shao@gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 12 Jul 2026 14:34:04 +0800
X-Gm-Features: AUfX_mxCYDdD6z8a-Csmxv-OMKDHFinCVOYPN9LK_qmXdlu70OdjjCdCliGhaJo
Message-ID: <CALOAHbCjOsc2JcwwMLOdpx9kQw5TncLZBtGJZfimq-UNcHJg9Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: append %{?dist} macro to Release tag
To: nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13993-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laoarshao@gmail.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laoarshao@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A93C1743FE2

On Sun, Jul 12, 2026 at 2:29=E2=80=AFPM Yafang Shao <laoar.shao@gmail.com> =
wrote:
>
> Add support for the %{?dist} macro in the kernel.spec file. This enables
> building and releasing kernel RPMs with a custom distribution suffix
> (e.g., via rpmbuild's --define option) to better match production
> environment tracking.
>
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> ---
>  scripts/package/kernel.spec | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index b3c956205af0..c732415662ef 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -6,7 +6,7 @@
>  Name: kernel
>  Summary: The Linux Kernel
>  Version: %(echo %{KERNELRELEASE} | sed -e 's/-/_/g')
> -Release: %{pkg_release}
> +Release: %{pkg_release}%{?dist}
>  License: GPL
>  Group: System Environment/Kernel
>  Vendor: The Linux Community
> --
> 2.47.3
>

oops!
Apologies for the confusion. Please disregard the patch, as it was an
accepted patch accidentally included in the same directory and sent
alongside the intended one:

  https://lore.kernel.org/linux-kbuild/20260712062834.77872-1-laoar.shao@gm=
ail.com/


--
Regards
Yafang

