Return-Path: <linux-kbuild+bounces-11292-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFkQENwmjmlrAAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11292-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 20:15:40 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8379D1309E0
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 20:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D845315AD0A
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 19:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2D526E6FA;
	Thu, 12 Feb 2026 19:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHjKdxuT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4911C22D4DC
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Feb 2026 19:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770923622; cv=pass; b=NIp9IwpSaeSVICRIppiBo40aRR9IzybfR43qydQMmJ97jW7ReNE6OvyvdvDm3ut2U2xH61pLSt/pDzwdR+luq+kTg5oKSYnsrpsc/108IohsfghN8JazNzIJesbp2DPOBSosuI3JIhxSQGTB/k2Oxlt285iVqNHcbDTk2RRynyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770923622; c=relaxed/simple;
	bh=WrAU5zrjcCn1BNqI30iviL/tAjy/fZDO2FGkV8Y+Dv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7ir3UYgPxxzj9szYRR9+sHTm94+GXje120fh4GSAYnRT8AmAreioJWIYJsIBSkcRcoYstKPATpsinMMc+FS3yT+Hu2uS4jc71xlPYA8Il9Ldz9zZpJgBvfFXIlsPymDOHtyx7MY+hhbcCuISBiY+fY9tQv6ZQMC5HuZzk7lB1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHjKdxuT; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12711867ca1so6117c88.3
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Feb 2026 11:13:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770923620; cv=none;
        d=google.com; s=arc-20240605;
        b=RQCJEXX8/5GhufreFloixQ6X79j4R1oSHykAFtftdatiTwr258yIKPGWJ/sY6d3I1c
         1FMeiWUwjX3lDmT29zcnfE3hmAHN38B+XYNkRqrpddOqSC0W2ayio1sQQ6F8gSao7YPW
         mEN6Ezo3RvFDuXXnI4MS1I0okGcwRu6K0HEX92wR2j1psEc+mwl39dteS59vELDTQiWm
         eGY3s8TGYTfWxCO4/DjeZdDQUENCcKp7eDdRnzA8mGTivVEeR90bfLp6UgSv2bc8FfKF
         /JCooX5ANOPpzYrTQzchAYoLarERw8wvMCrZExgWLVLlWzByPOFpBpNMCcoGe+3K37Z1
         Cr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WrAU5zrjcCn1BNqI30iviL/tAjy/fZDO2FGkV8Y+Dv4=;
        fh=Q3y6WTjc9D97PalM6NiTQG53b93HPlHqVu84AbcHuo8=;
        b=B+jv6b/MU5B42gw3F52E0GZT+PlXawGpTWFWr1nUzZWSa9Oyhf3smKIaw44XTz6F4f
         fEcdX0r6Nn9djn8V7JQaeLgazMFXtgR0PEvxu45jXnYJjg+YsiLmly8WYIFe1PxzMwd4
         Xq2YNvSQ3gRr7EeDC3A+CaRQAyz2vBDYvRihpvSFw903ZSeswK5OGeaByzVKcfESl1GN
         3TRM7q9QMhwwN4qcqtmS0olvM9L9SYdBrCpAWG698NtjEknEUc1DWCPxQbkQWUUYgabb
         Ac0lsHvWnRAMUXSsMQk+kOnSytLD/FQEFf1UQDkwerMFir2kT8J0/cGeKr03kR9o+Dx6
         /wtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770923620; x=1771528420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrAU5zrjcCn1BNqI30iviL/tAjy/fZDO2FGkV8Y+Dv4=;
        b=WHjKdxuTIk+Mm/qHn62GlcK5S1Svf7wfP7HBiD4rh3I87DPvGWnPathsSn9FNolcl/
         ezvVnu/H1fLxN3uhUNTAoGCs0AvZCPwQsJZ/s73HujLrC6UXAOKPgOAkTlucSPs3BMcK
         Nn9Xfo83/ccAQ3zWYt/4vAzDfDqc9lYVe8eZ+wcct6MN0WasjX3m07oG+n9B9ap3Myha
         AB3HV8Q9XavAtDD3TOOkIYvUFpIBrbmPMClYTL5t6l/B22T+0y/bQDDoAApheFPJ6hLi
         5V/joKBMLt8BAk1YnEhTqctern32QJn+VrEIHX0pm+e6LGFFpUSS8NFUcq0liKYVwTzo
         eEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770923620; x=1771528420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WrAU5zrjcCn1BNqI30iviL/tAjy/fZDO2FGkV8Y+Dv4=;
        b=c5WDukt109krB962t2dJspzlWYeME1KwyAZp+/f4xZSPE1jtufl3nA+wIRWOE47L1n
         Xaqi+bQcJcbjKSrMzGeIF0CsvIi+utCnihPoo7hdCMj5XjTXhOiYrMV+S3Rr/e4tWl+c
         NGuclZsiX8pEVOeoxD1238MQ+EudelKJFkhbwlRJXjqtQOvtCz9gZ0DzwupGnxbnmNrX
         Zde2LSQh4vP8MsTbCVqmZQpLDvDF9RnzIF4EpDiQishWDpM7bROOHQ1sj5ZBxXX841Yu
         CTrItaKaAzMpz9COwP2Y1GJOBrO5OSHLWlfX6fR7xrTXf/lOoBcS1Wgn857n+9cGYa3F
         zWyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9SnAuhWqjFFKzTtyW/aTWHb9pPIIK+Z3IRPfe1pCZtzvMluLW3/D+STIKg0H3lqV27GSvaJtZVWlsAZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuUqwz4owIhoLV0gpYzke0Teqcqp8NFBeRTZzoBjE4sBpVpQTn
	zHNEWGxGKWuScmBXx42jbjbVhRvXlSlfqAEiLwU7FcEcM/Dlu2sdsI1PNnomunzXBh+48G40hl4
	6B/JR7y8QtLOY6EFqNYvq6299trB54Tk=
X-Gm-Gg: AZuq6aLFdsQT2d6GIICbrVwzXncRqXmrSaDjRupH0ebx4PDnzpUaKBqqJf0OLR6dVRb
	y/SCa8N0gEBatinWWJkvjAQUYMgjwN2jA9rHr/wUnLCQLSAc+3LQzvnMHbkMKyoMz+3tFUIsKsz
	es0Ji75zyIlxh/dz+n6gK2WxDL5SJ1SvlFt52G0kf4Fh0oTZqbYDUKGZnboEsQx+OIxDGLv2XIL
	SWWjBI9L8l8e3bWJ+ypxA8o4yffg5hJBazt3BrdXaTn91TATlWMyimZV/iuEL3FLaaIS4XXtuup
	rq1V2lpXUvyaHnepWzW6vAnp8Jigbo5j74KV9+n63SiyWVFER0860XJ+eFZPYC9mhbjBLHaWbye
	aPKzHSyTpHUYueIKsA1xmGE++
X-Received: by 2002:a05:7301:1299:b0:2ba:6978:2b0 with SMTP id
 5a478bee46e88-2bab861518amr148339eec.4.1770923620251; Thu, 12 Feb 2026
 11:13:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212185810.648364-1-9erthalion6@gmail.com>
In-Reply-To: <20260212185810.648364-1-9erthalion6@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Feb 2026 20:13:25 +0100
X-Gm-Features: AZwV_QhZnAoZ1Pw8ot2wsf-1EvRj4OOkK0rQDza5R2-O6LTu3qN5n9BNcMnTarY
Message-ID: <CANiq72nmzYkHpLTwWxn71TKKTPxWprjPHxBau7Yat32P0zE3pA@mail.gmail.com>
Subject: Re: [PATCH v1] tools build: Fix rust cross compilation
To: Dmitrii Dolgov <9erthalion6@gmail.com>
Cc: linux-perf-users@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11292-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8379D1309E0
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 7:58=E2=80=AFPM Dmitrii Dolgov <9erthalion6@gmail.c=
om> wrote:
>
> Note that CROSS_COMPILE might be different from what rust compiler
> expects, since it may omit the target vendor value, e.g.
> "aarch64-linux-gnu" instead of "aarch64-unknown-linux-gnu". Thus provide
> an explicit RUST_TARGET_ARCH, and if not specified, try to match
> the CROSS_COMPILE value.

I would suggest explicitly doing the mapping automatically, rather
than guessing or requesting users to provide one more variable, like
we do for the non-tools side.

Perhaps using a "table" like we do for LLVM and `bindgen` -- see for
instance `scripts/Makefile.clang`.

Cc'ing Kbuild and rust-for-linux.

Cheers,
Miguel

