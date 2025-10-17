Return-Path: <linux-kbuild+bounces-9207-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F79BEB0E5
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Oct 2025 19:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 737D718935DA
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Oct 2025 17:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F672F1FEF;
	Fri, 17 Oct 2025 17:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPYNpVnI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB2129DB6A
	for <linux-kbuild@vger.kernel.org>; Fri, 17 Oct 2025 17:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760721690; cv=none; b=p02fgATygud8lVhtkorTNuceDjk6uzSBW5SrrDvNOpUGYgkTGMry485NFCv0yXtivkLuWr2S74DUUI6ULiIeVKJQMnNRevsQUnEwn+zIdpFQyvQXNuX7leL2MIfZqmtawHgax0qJVVEeum036ECV9zPgi4wPLQA2zCLF5e5N/3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760721690; c=relaxed/simple;
	bh=ZDlKJimU5yJhuf6h4fCvKg0ckr1WuWl19ZMREUl6Jf8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fgeV6uegAr3UHB6Wab13u8XI2fmmW3rB/X/kt9u9yut9GM8OnVs9+G098UbZqEl9PnrWtrdKCi/6G98hdiVhP015T6kK78myzNZM4N8a8+gPrb+NbIo3MS5mkngmmHMOZDp7/G0D4lSkVZ4GtSwLNQcPgvpsqz+h7Ja6K9dS7us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OPYNpVnI; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7811fa91774so2038684b3a.0
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Oct 2025 10:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760721688; x=1761326488; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZDlKJimU5yJhuf6h4fCvKg0ckr1WuWl19ZMREUl6Jf8=;
        b=OPYNpVnISNHKqsvW580nH0B8YmVC6jbYaeEEz7Wm5Xk2iZ4GKIJLoziUB9nM3BFHGF
         oMSvlVTGmrh50/HWUokAk73+xxfEVuW5DfM3mjptanwUmwD3Oy/sApteCGFh/1Y0mo8c
         P3xZYq3lIxfcwXdd2nky5SyxBQRUtrpChl7NP26VZbjL2XpS7tuQ8eqLFZt52T5Sz9e2
         Bk/74Ag4f7rlr9cMyydnlknPf0xSnEXHKZxX8iVFjoiVF3fg4LsRVQeLc6CGefD5x9w9
         Zec55/Xq4SrAmS2FlQwARZMXFFymCO2ka2u0tODqgubfwD2e9qts7Clg2N/8qgSmHQpI
         eXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760721688; x=1761326488;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZDlKJimU5yJhuf6h4fCvKg0ckr1WuWl19ZMREUl6Jf8=;
        b=VX88Ik/QG75oqVVeQdN+KuSC2Oi7sweTnGR9l+v5vTXMShlKgL1+uNPQavEcoUY9QD
         0D5KDYDWzXMCaIwDcD45rmu1YGzFLjlf0Edhx/lPwqw8xJl5fP34S0Kayz7fBt4GW8+a
         0kH8fOyy3+o0a82u47whQADfbnqeNJbVMpBvWymjEprwZC3Y6pn9+imeSIKKFicgxNke
         DnXZsN1WJfchjhb6E0auFP6m+wT1bu7jDwDJUYeoluUfrlgujDtNxesV9QPkJ5oI0E3A
         1ioEtgE3v8KyFt0J58Hd1bLBMy7yDgHV4oGMGi8KvHaIr23iUZ/h47fiAm6IRUlbLJY/
         tjtA==
X-Forwarded-Encrypted: i=1; AJvYcCVCB2YOsdNa64IYnTr1ZC8uPbApXygbLgazsKV36CjjQe3HumP8FeU59hYBtysFkOWMpqGAI7MIYz+4HSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZloUVWXa1tmklDTdoO/l0A0WE0y3AACpAFglEiKlVxI8k/2Vc
	ACeJh1sg+Zlxd4vNUnJe0Y3b5sW7lXATIzLXvaDImkZAcdkNX+6/Sk/nQkth3cf+
X-Gm-Gg: ASbGncuctywD71LCToi/EPVf1EQxTUfl6wtu03lX+pj/T0KVbhq7UFViDK+KRfp8BF/
	c+S+5f3YEuaHBRfXEqRXWyXiD9fxiIVpTPuPv4WMm5iEQDDNzrJqzWRoGy6/IF2Sn9Txo4Ts2WC
	T3U5AhMb8cO7TaFFD3loI/4eFALRYwSh+rBqyA0Lf+q2+NhjGbs2oRTs82qFmz4uD8RqwuaiC2J
	9y7kn1AydCjJbq1abpJCCE9/xLejIZ6R11LmUh7tfCfBXTBIDQFedYCC4tlUppjlQ9ZU5oG8iyG
	iAdKHCEDgyLAIYDjBCfahJixmjg52Sz89NWB/v0g0BBEIZHAqpeNuMn6FNzASvmXaCGD7ZpIxBL
	5UDY/fYUl7hdWSTjVKDs7yeO43QZgzKnEV4/kP8/DPAR0Xay93thvpAClsL97yAmOYqupPr64iZ
	9qb3spm5oTfDtzeiq+HKj/TROm
X-Google-Smtp-Source: AGHT+IFQYLtYz7qONoqCEU96HpuXSGRA2s1vrwiIlcoSHnAwgXFDW4IUXMHSrbKxOMdYny4f7jwfBQ==
X-Received: by 2002:a05:6a21:328a:b0:334:97a1:36af with SMTP id adf61e73a8af0-334a8523ebbmr6345679637.13.1760721688421;
        Fri, 17 Oct 2025 10:21:28 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:49ef:d9f5:3ec:b542? ([2620:10d:c090:500::7:77fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5608eb4bsm166765a91.21.2025.10.17.10.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 10:21:28 -0700 (PDT)
Message-ID: <46370bb8fcb2f01bce5402a6f7937426731fa450.camel@gmail.com>
Subject: Re: [PATCH v2] scripts/clang-tools: Handle included .c files in
 gen_compile_commands
From: Eduard Zingerman <eddyz87@gmail.com>
To: Pat Somaru <patso@likewhatevs.io>
Cc: justinstitt@google.com, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, 	morbo@google.com, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, 	nsc@kernel.org
Date: Fri, 17 Oct 2025 10:21:26 -0700
In-Reply-To: <20251008004615.2690081-1-patso@likewhatevs.io>
References: <20251008003739.2659141-1-patso@likewhatevs.io>
	 <20251008004615.2690081-1-patso@likewhatevs.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-10-07 at 20:45 -0400, Pat Somaru wrote:
> The gen_compile_commands.py script currently only creates entries for the
> primary source files found in .cmd files, but some kernel source files
> text-include others (i.e. kernel/sched/build_policy.c).
>=20
> This prevents tools like clangd from working properly on text-includedd c
> files, such as kernel/sched/ext.c because the generated compile_commands.=
json
> does not have entries for them.
>=20
> Extend process_line() to detect when a source file includes .c files, and
> generate additional compile_commands.json entries for them. For included =
c
> files, use the same compile flags as their parent and add their parents h=
eaders.
>=20
> This enables lsp tools like clangd to work properly on files like
> kernel/sched/ext.c
>=20
> Signed-off-by: Pat Somaru <patso@likewhatevs.io>
> Tested-by: Justin Stitt <justinstitt@google.com>
> ---

I tested navigation to work in emacs+clangd combination with this
patch for the following files:
- kernel/sched/pelt.c
- kernel/sched/cputime.c
- kernel/sched/deadline.c

All included from the kernel/sched/build_policy.c.
Navigation works for entities declared in the same file, entities
declared in headers included from build_policy.c, entities declared in
headers included from {pelt,cputime,deadline}.c.

Note that sched/ code [ab]uses the pattern with .c file includes a
lot. W/o this patch clangd is completely oblivious to the content of
the above files. Jump to definition is almost useless, who-calls
queries ignore functions declared in these files etc.

Tested-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

