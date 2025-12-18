Return-Path: <linux-kbuild+bounces-10168-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0068CCDA22
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 22:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33C0A305741A
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 21:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3147238D27;
	Thu, 18 Dec 2025 21:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYB107p0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14C22C21C4
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 21:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766091926; cv=none; b=hPhPB9MLoBKdgUGpHztVhTtt0+np6VTIaE7pyZ4XpHlQqc9h0ZH1BZjErJZGbTkO12UfIrCxs45aBD6s5qSmck5xo5+MTxBgL7dYVoLYnahPVV4lh8xc4CjcWt0VE/UbH9mi303OHM8daPDTyVf12p6VDBhHu17ZIdPKPMpo6yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766091926; c=relaxed/simple;
	bh=Wk9qv34inWutk0debgHw5c52MI0wE6RiXjFrTeu/W50=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j7ufNNq3SJL55ZdSDmIqqUicCIU/khoqfO48pjQrq031D6b4b9Zvqug/WdgoyXFpxYgadnloMODzG57TXY8MPc7j9yxK4jyzM4L1wqhJX9CfQc/+RY3nQnjELwb+EPGAQkV29C7uBgJGVZ3qVLTX2rXz9js1tvojjcIX+5ix1wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYB107p0; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0d52768ccso14234185ad.1
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 13:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766091924; x=1766696724; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wk9qv34inWutk0debgHw5c52MI0wE6RiXjFrTeu/W50=;
        b=EYB107p0ogLZ6QCHj5VzSyaLWq16F2y5+xUMLJtGVSXTPH9nCg8BNMFSsl3rjClxNJ
         8yQ87eM6WjEGqfko215Q/k0UGqYT8BE0s1T6d9NuxBXIhpysRtQp/sVME1y5pPJw6D9D
         zt6lrp/87+sh/xJouUrWejvzLOeg3lQ4OqgoGsv5CiqiRSPU3VHzd2TJVXuYCHKD1czv
         VCHHPRwZ9dQZ5PuwWKfhzSgDb1YKV08VZQXwAOagC6ILTD7Etdjhi+SZtqbVXJRLQPKg
         dnmq7rATytJpR+kIzwxdkPlH9PUA7e1bVcwzWT6DElIKo2ouMWJZZ5YJyjdjhmDSn2Cw
         T2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766091924; x=1766696724;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wk9qv34inWutk0debgHw5c52MI0wE6RiXjFrTeu/W50=;
        b=gJjwC0KiWt4jIdSH8Bh2P+SIjUk5i9qbO6r8629nEdijMYg8Dq8HPQC8hRHpxlPAiT
         NbaMRuckkXqX8uNq8QHM8D1EybboSqSDsiyCOHzlGLtMipgqWBIYlid3t+kzrSg9Sm3T
         vklBAzaH4vDHrxoy8lSL+aANzR1AS7ytWKD99u3PPjOgma4hhjluYsBwz9PmwvdaayjF
         fOioObwKWaaYx/39k9uKKdxNgJ6FELUN6she0EvH3toC3/jnX1oE6jpVmKlSAX3xrI15
         Kt6WM/cRASodRY7NbP/OjJ2RaFeetxofRo5ET3yQOYbgBDn4rt+N6Ug2/TbsUatm6Qu4
         lulw==
X-Forwarded-Encrypted: i=1; AJvYcCX2HlRv1T6kON8GLk/4pOsoAGaTgciaqmRh0s7VnhQW1oubn/aOxHO3YNgM9JyndSgHOvAaRmHW1TXJpWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5gPfpYUYNW6UuFksa9NSwzpjF9FcHslA89++uD9OcidzuNQ1F
	vIWgPrpxxpAzRUQ+/1KPFNUuPaeAeqd6WsHXV0Rl5N9phE7LRQJqoyC9
X-Gm-Gg: AY/fxX4TbPgrkBBD8qo5wNf0g7F0UhRnxmzoV4IMqrCUMvHAQHBZ3Df7pP8WJ3J5gqF
	NC95ExFuo4cn0AhxntjNqcx0FNIWlQt8Ti5tfO4gZ9SK8EysM5KQE9vP4s2SzmnDtJpkhAz9sPR
	DPJPvymi1cyGGGa7HO3BrVunIBX3hSTuVVptyEIT5xWfJY8J7qAderHqJWlKJdCnY9lkWG/htFw
	/UHM47Vsd0yGUr8kHiYs2mWQ180xuO3fWIKkjUro2Q6BlwgPLsUpO6xxmWQtVPPjiU+FvAZ/9XJ
	05wcjHGc6xSd12WjGCV5H9MVph8dSG5iFk0y6yBCkWH3F4zNIK9sEoOBtlMhXeuxDmYzBS9Tobw
	ZxdAHG+r6yMZil+de5t1C2woF6UIpwiS2+xJPMMf61neVPhuS3C5XGHr4vLChIbfLHgnbX21rQH
	DxDrblA/uFSQjGN0XTRW2b5w9s4bFGrnKFbnkU
X-Google-Smtp-Source: AGHT+IE5wqF1Ur/4n0bAKqhUgwQpIAW7BXffJ7Vx2YXELxiT7ohVhw05y1v6Iu0zG3ReeHlWkO5oUA==
X-Received: by 2002:a05:6a00:4006:b0:7e8:4398:b362 with SMTP id d2e1a72fcca58-7ff6667949dmr378405b3a.53.1766085763362;
        Thu, 18 Dec 2025 11:22:43 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:d912:2088:c593:6daa? ([2620:10d:c090:500::7:e642])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm99807b3a.21.2025.12.18.11.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 11:22:43 -0800 (PST)
Message-ID: <0be0a3b4d39e31653ce38c16b413d717921f2ced.camel@gmail.com>
Subject: Re: [PATCH bpf-next v4 7/8] selftests/bpf: Run resolve_btfids only
 for relevant .test.o objects
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alan Maguire	
 <alan.maguire@oracle.com>, Alexei Starovoitov <ast@kernel.org>, Andrea
 Righi	 <arighi@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Andrii Nakryiko	 <andrii@kernel.org>, Bill Wendling <morbo@google.com>,
 Changwoo Min	 <changwoo@igalia.com>, Daniel Borkmann
 <daniel@iogearbox.net>, David Vernet	 <void@manifault.com>, Donglin Peng
 <dolinux.peng@gmail.com>, Hao Luo	 <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, John Fastabend	 <john.fastabend@gmail.com>, Jonathan
 Corbet <corbet@lwn.net>, Justin Stitt	 <justinstitt@google.com>, KP Singh
 <kpsingh@kernel.org>, Martin KaFai Lau	 <martin.lau@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers	
 <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nsc@kernel.org>, Shuah
 Khan	 <shuah@kernel.org>, Song Liu <song@kernel.org>, Stanislav Fomichev	
 <sdf@fomichev.me>, Tejun Heo <tj@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>
Cc: bpf@vger.kernel.org, dwarves@vger.kernel.org,
 linux-kbuild@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 sched-ext@lists.linux.dev
Date: Thu, 18 Dec 2025 11:22:40 -0800
In-Reply-To: <20251218003314.260269-8-ihor.solodrai@linux.dev>
References: <20251218003314.260269-1-ihor.solodrai@linux.dev>
	 <20251218003314.260269-8-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-12-17 at 16:33 -0800, Ihor Solodrai wrote:
> A selftest targeting resolve_btfids functionality relies on a resolved
> .BTF_ids section to be available in the TRUNNER_BINARY. The underlying
> BTF data is taken from a special BPF program (btf_data.c), and so
> resolve_btfids is executed as a part of a TRUNNER_BINARY build recipe
> on the final binary.
>=20
> Subsequent patches in this series allow resolve_btfids to modify BTF
> before resolving the symbols, which means that the test needs access
> to that modified BTF [1]. Currently the test simply reads in
> btf_data.bpf.o on the assumption that BTF hasn't changed.
>=20
> Implement resolve_btfids call only for particular test objects (just
> resolve_btfids.test.o for now). The test objects are linked into the
> TRUNNER_BINARY, and so .BTF_ids section will be available there.
>=20
> This will make it trivial for the resolve_btfids test to access BTF
> modified by resolve_btfids.
>=20
> [1] https://lore.kernel.org/bpf/CAErzpmvsgSDe-QcWH8SFFErL6y3p3zrqNri5-UHJ=
9iK2ChyiBw@mail.gmail.com/
>=20
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

