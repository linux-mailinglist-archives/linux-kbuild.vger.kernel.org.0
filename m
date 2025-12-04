Return-Path: <linux-kbuild+bounces-9999-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F0FCA4D84
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 19:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 932A4304F0A1
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 18:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B8B33A6E1;
	Thu,  4 Dec 2025 18:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yuva/7M2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBFB33C18D
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Dec 2025 18:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764871586; cv=none; b=j6YvYAr2Vmii0XxsNz3DjItX7peW1HC6dr5lOWho6TceDRg6q9bU7Wy2K14AwV6jswPi7+gnGFbLuCCi+toyTBA6eh/mm3MCL21qucLRvRIcEsoVudH6VBzZNylljKwXZlpah0mq9Jmf7b1Eq2/3zgNLWsx3LIdKW9y6JVLfDfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764871586; c=relaxed/simple;
	bh=IYlPdcQB+qlawwvAMYnbc3ygWE7N3I35+bMQZp+FjW8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oRoaX8n16AEJugaZbZUMcHYej1c8xmFBbIV13xj8O9u7az8rtpLXZ9vCAZx0QWbaHI2Q29gkm5tY8bt+QIzE9mv3hCPUSJqCeyHKrhCep5uFjfIr2YuBUDrMyuGPDo97UdxvMp1SXC7h8BVpdxpuKCa74KZq2MDuimqR7FbM6JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yuva/7M2; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3436d6ca17bso1323323a91.3
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Dec 2025 10:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764871584; x=1765476384; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IYlPdcQB+qlawwvAMYnbc3ygWE7N3I35+bMQZp+FjW8=;
        b=Yuva/7M2CTYCcwYKWn2bSOPOfeswxxCU4WJ0ZLugUyWdAiAigIkDLE041v/dzWuurt
         jtH4JvHq2DiaZ/4j1bV/Ga17rwHNjOjGyj/ebxuwdZolMBNRpbd8XLnAMwrwXimXEBru
         onDY647DmEO0q31pQYiYidVZ4m72B08YR+1dhGJV6VEfJlXvz+bxPRUhjbMACIu/Dg8m
         gIFXeV59a6IE0JKR85uajI8DKS5OT7p/tYFrc8854hCGNZ+xzMroWLTAqgPfz6tlQknu
         FR8+qVKzrkYIUHvs7OcwV4nIdfLA8s/IggdzDAqxUopcEicl8kEG/imGhN4gVnp46Ijp
         cVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764871584; x=1765476384;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IYlPdcQB+qlawwvAMYnbc3ygWE7N3I35+bMQZp+FjW8=;
        b=lke3JMHVPwwN/zyoxew1gyhygYoN3ZqhbEjir76pPGL3P12HpdzkvNdny4E3aUswNg
         TXnP5KMlZhbItBREnfpOPQicIqQVZsiT20sEIOMIxXKyoNzqsb0b5zTCmZoeZCT9oxgE
         Q8fkq4k7hp+ChwQhguMV53KIC0LbpexDDZTQJzRDhO821yrTnopiU2iufezpHX/EaDOh
         tLucm9+SGyv65XNpjMCNVptAQFhjM/ptR7kHiYKjXJJ/pPTquJYXzvS5zrLRXq65cNLI
         EcyvzyTNMflYEONiYplMKkT6DzwUSBnC2Ys4EAwNM+tkJTPfc1MogMz2zL+/x6YcByi4
         NzKA==
X-Forwarded-Encrypted: i=1; AJvYcCXp5gfYlOBZQj69obb7qQOhhoI2lniZTQRD19L4XYnb2LGgLLhfeji2pPdOVDCWYutVbGoCrAbM2ze8m7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyijUUGo2U9flHm/GeSVnK+b7TMa7FCSKKn4zx41qfg6cuthD95
	2tPKox4gWo5qyssJmsanV7QScVGWkHM/u7DZLJbz5tiyTqdosBl6pt7j
X-Gm-Gg: ASbGncunAspIcGrPFdkU/8qs5ipLFoqHwNV9/vYFUz8r8Sz2JR+6Fi8MqfCZ53zLAzP
	Vr/rSNDLH/CSxrqUrHyXvfJQbdE45dyDCPSLN5oyLahfP8hOxnkha6L2oy3s/texCteL+99FZLe
	wlDvaR0eilxiuuL9XEDYm48Sdyw7B0Zc7qW03c9hUyOnYKq59Fz1RUBKzE1q81UGe2wjF0TbjhA
	A0YLIL0QgAtQ9nXpZXE5UoW68PQ1n2J0a6IXu5Uue3vODRB4rM1lRmLRI+pKO7/OlHcdBudhU+4
	DblZssV8IW/Gn7tcCoMptHaXu2yVcf1TjwPONI0siTzMsFJL2tBpfOIZhIryfvz4GEp14vKyBYZ
	//PwoM8D/pEpKksUQ3WQkzBzId/FiOgZB2lhYsmaPVJg2jJohmSOoiAQjh1Zk9XoxOYSv9DG1av
	+L1+dAtF8v
X-Google-Smtp-Source: AGHT+IHLCo+72DPRWKONv/JPgaSabOzTBsVk4U00GSBcgCo1zw2Ja1fCMHkVELYZuK7F1CmTW4l48g==
X-Received: by 2002:a17:90a:ec87:b0:339:d03e:2a11 with SMTP id 98e67ed59e1d1-349125d0973mr7484739a91.14.1764871583726;
        Thu, 04 Dec 2025 10:06:23 -0800 (PST)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494f596810sm2395842a91.10.2025.12.04.10.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:06:23 -0800 (PST)
Message-ID: <707080716569c7de7c3cb5869b67d62b55a96b68.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 4/4] resolve_btfids: change in-place update
 with raw binary output
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,  Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend	
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev	 <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>,  Nathan Chancellor	 <nathan@kernel.org>, Nicolas Schier
 <nicolas.schier@linux.dev>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt	 <justinstitt@google.com>, Alan Maguire <alan.maguire@oracle.com>,
 Donglin Peng	 <dolinux.peng@gmail.com>
Cc: bpf@vger.kernel.org, dwarves@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-kbuild@vger.kernel.org
Date: Thu, 04 Dec 2025 10:06:20 -0800
In-Reply-To: <79031f38-d131-4b78-982c-7ca6ab9de71e@linux.dev>
References: <20251127185242.3954132-1-ihor.solodrai@linux.dev>
	 <20251127185242.3954132-5-ihor.solodrai@linux.dev>
	 <de6d1c8f581fb746ad97b93dbfb054ae7db6b5d8.camel@gmail.com>
	 <e8aacbc8-3702-42e9-b5f0-cfcd71df072e@linux.dev>
	 <763200e4f55197da44789b97fd5379ae8bf32c08.camel@gmail.com>
	 <79031f38-d131-4b78-982c-7ca6ab9de71e@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-12-04 at 09:29 -0800, Ihor Solodrai wrote:

[...]

> Ok, it seems you're conflating two separate issues.
>=20
> There is a requirement to *link* .BTF section into vmlinux, because it
> must have a SHF_ALLOC flag, which makes objcopying the section data
> insufficient: linker has to do some magic under the hood.
>=20
> The patch doesn't change this behavior, and this was (and is) covered
> in the script comments.
>=20
> A separate issue is what resolve_btfids does: updates ELF in-place
> (before the patch) or outputs detached section data (after patch).
>=20
> The paragraph in the commit message attempted to explain the decision
> to output raw section data. And apparently I did a bad job of
> that. I'll rewrite this part it in the next revision.
>=20
> And I feel I should clarify that I didn't claim that libelf is buggy.
> I meant that using it is complicated, which makes resolve_btfids buggy.

So, pahole does the following:
- elf_begin(fildes: fd, cmd: ELF_C_RDWR, ref: NULL);
- selects a section to modify and modifies it
- elf_flagdata(data: btf_data, cmd: ELF_C_SET, flags: ELF_F_DIRTY);
- elf_update(elf, cmd: ELF_C_WRITE)
- elf_end(elf)

What exactly is complicated about that?

[...]

