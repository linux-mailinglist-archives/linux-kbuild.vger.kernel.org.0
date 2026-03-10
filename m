Return-Path: <linux-kbuild+bounces-11810-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLPhECafsGkwlQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11810-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 23:45:58 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 406DB2590BB
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 23:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 829243025E35
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 22:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56553BE62C;
	Tue, 10 Mar 2026 22:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIkxt3pp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D502FE042
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 22:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773182747; cv=pass; b=mN04ItLP/IXrAAmDAASu6UpPI9kjvU+bJvN4j7bl7O69VT8B97aJwV2SbRGArIHxKvCzr5J4pgyiLFOrbbCw3dCciujliKElM7XfsIHh8taQqXe4t51epnhcrnO/H2KcRI5P1lXG6V3NczNpcXEV4w0hmSUevYNJ9w5Jg3/avu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773182747; c=relaxed/simple;
	bh=NwwXHeQBm0xRS2zYJadsYZWaw82EYyPo5w3EDKS9vp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=i8s09B6KbcOwD1Bmq+ql9pP5MWG50OoNjh51vS+gL8QzFShgYLtOJXcgOl1hfO4wP0IC93YpCD2wolrUKGqi0d9n0ImgpSjJpX77mURNj7QRE1CIQ23WiQTCvyZvn2Z3nbvG9GLoTAxUIL5LQhBLq5U/UIL+gsUId0icNvRnOvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIkxt3pp; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bd5658b901so947388eec.3
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 15:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773182745; cv=none;
        d=google.com; s=arc-20240605;
        b=hGgphxK86/Sv0wWPzzbkcAmrfp0vCQ2euAyhWKTtcI/0hUBgookIviEA4UgTvW2gCY
         2W7Z8G9j+hParwhhpb2Bbmihcb6MxCiBRUd9r6KPEEOaGqiFhlL7N/7NAwkoWWJBRo77
         VjcOLuOOKA92UKeUPeVEaRXujLtvAgZaCpm/z0c2qnBygx7+X3nnaC6e3rURSs58mlqM
         3uk8dnNyGJqOTKrW3oQlOTlENXtk2TIA7B0XNiYYC28HIG7fuDacQkQqMeMBbeTzaHI7
         7YjGmnE/S3+PzUqRfmFQo5vQRABfaXoY7RJJh+XLew7bxOw6RsQ/fTxngUf2uXJ6ytoH
         GTYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AcppTpjnVFhwx13Ei2/3uaCsu4NJqsetsGA5pNmZ6VM=;
        fh=7LubV0KRQH/IVCW+ep4EVtaZZOROfSNzCrLKl59krws=;
        b=SZB0izdGfji+EM8k3L2RGfL7H16Jns4wS8NRR+lecXerppKM2gA/5Gp4gAVlys3r7q
         vgdlHCuZ12nzp8gKS6G5Os9siFDdbw8Il2IHgERyo2/5SC+EeFtOzcg0BsNRmKTgZF/A
         rfscpaD0LkYEyPrgUbfGQVuomnYNpbN5F1aI/OS11ZzdUgnrHBx/p/lpDq0eOiz68anG
         5ZPJP+lSZ3tbI0lyAlNyGwisZcSPzFipqNe6UROCHBZfQ7zSlExNSUI9j7eUU0NL68+r
         EfFnQIanHDaqroKnzJx5SE6fQ6MAnqDxwPkIUBDvjvBWhXeWPnR6FMvRKmYG8by3cltb
         PxFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773182745; x=1773787545; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcppTpjnVFhwx13Ei2/3uaCsu4NJqsetsGA5pNmZ6VM=;
        b=JIkxt3pp3CLOTQqhAFNxefuFPdiS2it8Up4l96I8OJHdXhDWcgEev4/os3tOee73zP
         P2pV/pv2tTXFlt4VZByLmwvD/VncXBozBRgi7EeFuqKrCqgd1s1bk2IFi56ilA+Zd0CG
         r/O3951dFGhc4crweV6247RJBXeNSHeY+Q7oIn3RLQ37/O3Slr/lwTNGPNuxCCn1V8UP
         Ke8t6cVagVf5YVaQDJh28dV6fFGcEkSVXSjIbvbLKF5ECSmUxkwt490c++kumccQRa1H
         cUBjr8q+aEAlxsAvnncuz9F/k+tYCkUf7TDaUAG6t/4vEl4lMWTh7d4NcunXbnY0wX8q
         /5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773182745; x=1773787545;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AcppTpjnVFhwx13Ei2/3uaCsu4NJqsetsGA5pNmZ6VM=;
        b=LoukALbGbYtqSPvGdl/X3aTFDUfwH2+pQ5hpKZ4X8hsuKPX/TzUCUF3NQTUrQAwjkJ
         irKi1YRpnc13Ret1XYsK77KQzL0rST4WqKJZGxWvmFqUHl6BgCPxy/cfU2votgHL1n5B
         bCyPAyDWlu0fL9hKzAllmyean/IFiwSN8o0JMa0KHGhAIkR6G/O+GzAzx+yuJeDcRaO6
         jPbPzPn9X4JVLyhBV+5DwCaBKHw69P2PKfh4FZ0i7wAY4NdtAbHGkCR8q0GgGgVFWhm1
         LVf/oUTDQv9UTpN1RzD7P/UOn0oNMUqyDBCk12/EY++PGd232UUpS0SEdyYEuwoE+HcK
         HkxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXaomqUyii6ix8nx59O5RegBo4KNwdCgG80k84H0eH3OBfMz1fyehXV5aG9nUggW1idYaMQ8UX6YHgP7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBB5/blZY62lRUv/zbKVhfFbj82FE8R3D8Cglw8sXxsv90IM1M
	aL3oJtuMlZZSARaiBkRWt/7tfPHACisI4ZUPsAqsRoD/kWjTRZQO4Y309TfJ5D83jR3uQE9brtx
	VwD2xCefDGCIHT4AuQ4i7P7R5q3f+XAc=
X-Gm-Gg: ATEYQzyWXFUeGVKRTE/DrMaCcnrb7arDVHoSvaB4QPBf5I7NVbsyA2bggOT5OilaHm5
	OJU6C5THa0h2eJ3gKFVxvrUtQQtFmpQsA8GREzSjFK8Nm6MpSpJW6JciJbJtVwZ0++VW9G2r+cd
	gwKx+3zLhuxToHqJLxkQhRjqKXk/Gj/XtCo5otbiMNg8WkEwgdcPB3VBMIrh8uE5Ja2svAMMeb5
	ncC2aIEoJfgD7g02wK+p0x2JD//lworVOkAbUIFtrjEVyud4AdLMoXNLSZ7Nd4tojvc5frrUoQs
	uNrm3jJpieRmLNEhZqmds7DW03l/6CY+gCOgKoArqXtMoLN0QCG2kp1Ecg0osaG6s0DRzwY+H3c
	xq34vjM9QHUtTatReW4iqU2M=
X-Received: by 2002:a05:7300:3253:b0:2bd:d111:cf18 with SMTP id
 5a478bee46e88-2be8a589a62mr79976eec.8.1773182745139; Tue, 10 Mar 2026
 15:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203221224.GA2703490@ax162> <20260205131815.2943152-1-mlksvender@gmail.com>
 <aYS9bRugxr1rUvA3@levanger>
In-Reply-To: <aYS9bRugxr1rUvA3@levanger>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 23:45:32 +0100
X-Gm-Features: AaiRm515Nd5QLPcAZuOPkqTuJziLIjbUrquMksP3iOdIj6zJC7o4W4g4PWJLZlo
Message-ID: <CANiq72n-z0v_deUVPWeg1h0c6KQ+r6xfNDf72o29_0yy6KbqGA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kbuild: add rustc-max-version macro
To: Nicolas Schier <nsc@kernel.org>, HeeSu Kim <mlksvender@gmail.com>, nathan@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@google.com, charmitro@posteo.net, dakr@kernel.org, gary@garyguo.net, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 406DB2590BB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11810-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,protonmail.com,posteo.net,garyguo.net,vger.kernel.org,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 4:55=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wrot=
e:
>
> For readability, a less-than version check might be easier to read; and
> that would probably better match the suggested version range check:
>
>     rustc-lt-version =3D $(if $(call rustc-min-version, $(1)),,y)
>     rustc-version-range =3D $(and $(call rustc-lt-version,$(2)), $(call r=
ustc-min-version,$(1)))
>
> so that the actual version check could become
>
>     # The bug was fixed in Rust 1.90.0, so only apply for 1.88.x to < 1.9=
0.0
>     rustdoc_modifiers_workaround :=3D $(if $(call rustc-version-range, 10=
8800, 109000), \
>                 -Cunsafe-allow-abi-mismatch=3Dfixed-x18)
>
> or:
>
>     ifeq ($(call rustc-version-range, 108800, 109000),y)
>     rustdoc_modifiers_workaround :=3D -Cunsafe-allow-abi-mismatch=3Dfixed=
-x18
>     endif

Yeah, exactly, I think the range check looks simpler for readers.

I would say let's do it as an improvement on top, and to simplify the
delta needed later on and to avoid the `99`, I will change the patch
on apply to be `rustc-lt-version`.

If no one shouts, I will do that, keeping the Acked-bys. Then we can
easily add the range check on top.

Thanks!

Cheers,
Miguel

