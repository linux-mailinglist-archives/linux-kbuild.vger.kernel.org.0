Return-Path: <linux-kbuild+bounces-10074-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19615CB813D
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Dec 2025 08:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 384AA30517EB
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Dec 2025 07:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F852D663F;
	Fri, 12 Dec 2025 07:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3bJVq+D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6145428136F
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Dec 2025 07:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765523410; cv=none; b=U61wFV9WByzDrhraOJeYPUHuwZUQIGI4Vro0BuG9MXJDU9rlubffqNKGF6sKuVQTaa7U/6mYfPpLAx8raq2JR6V4vrjxD5//JtZmafT5noC/iRMCbI2wMM8VED2UvppUmeo8t5GSAfHYNGu6gPOXmBzrEcAE0ompqcVmYCK34q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765523410; c=relaxed/simple;
	bh=ski7sMyp+O2WAeYvfHItoMLgXRCcG6iQZx02RmEom4o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fxWZxDFC9pH0eD2IaxmoBffjpRctshAPAMeDA1Ca+h+4CpA+k+ahns+6sq3YbaIoSP1E9zCs4ARlCooD9ufpdIyAQvWPy0C/Ghk1iaS1oyJilkIqnk+loRvNoXpa4dStEQFymYd+mPcAmnxUjFQtvsSMtpxmZ7NfM0iN4ZeWoVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3bJVq+D; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7e2762ad850so927370b3a.3
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Dec 2025 23:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765523409; x=1766128209; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ski7sMyp+O2WAeYvfHItoMLgXRCcG6iQZx02RmEom4o=;
        b=V3bJVq+DEwo/GVW+NAWm4LQypQVAK0ZbbJSFzxkR+/cOMYahE0pid8b4tyGzx4zVh1
         jSF10nahz1dUd7EVqYwMV5WRqIT0x0vOX9ztutwGdxlrplNkP/jXeGhtOLjJkt6OZUEP
         wljBMY9dE0OFroYxk5/qU7I4urZf7gSgkPltQuasoo9cu6djCkT+GLHBOBa1WZr+q83x
         MKiLXiqoqOQDdmZTmTstydtqccGTqZWKC6xy69Q56NCUhgytAiVbPuzspHAcrXcZfRbr
         XiDxcw+C6Hl+ziX3FNI5r7UzOHyQV1x5iK0o5x0fbztoX3LaTuhqSIHJH8L12GdMdvH9
         P/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765523409; x=1766128209;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ski7sMyp+O2WAeYvfHItoMLgXRCcG6iQZx02RmEom4o=;
        b=qzD0oY3rmnJz/YFfTqEmpk96d6mZE5LBP6+ELrelN8ySuxVHEv8w4itPcYMAA9bA99
         T37SuA9ZIaQxY+w1T1ezbxNwBVl7Xc+9sCx0XMhJm6M/YnijLvysga1EENsqFXx7CxQR
         OEXq5n9mhY2AFp71NcPdraM83oL1/HalTxRVKMlkESDmC2pJCJPQcS9mZpnscB5Aov/y
         5G6PGEG7rwXPn0MSC/eeP44azY0UwmuO8O3PtOQ4cYVqy6Zux57ZPOYqPdLmy7gvaQrd
         afTmfSDvlwJdCFa5Ax5j9XMODFoS77WagG904PytzZuR7CwJNRTmno0ZGNwLIDwzLEUs
         NwGA==
X-Forwarded-Encrypted: i=1; AJvYcCX7in0DoLdwWtgeLxM5aQeUbgzOPkBFuyJAeqZtMG2fFVqsYbOPXPQYZbIO4rozVOi8kb2/EFaVKJJMznA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMQ66zprdhB77FO+LagPk4FQMDrT3g8p2Pfzub5VyFmTlnVnrO
	G/D1Bvf2u0OJklEFyZEUvPwqHBSEWeoOpP0qs5JCguclBZTAP4MGXeXE
X-Gm-Gg: AY/fxX4Hi2lPbtGe/AyDEXSC4t8Z8CSgUc79xmo5/RTAorGUfh3P0iT8K9kYLFQDgSa
	5jqdQl84qd/FyH8YWzLcrmtKM8Z+JSM2kirDbZS2c+okFD1+5b4MVjI26XVlNyw44Q9IUTUnFCS
	sc1fAlJJQtdtRW6zgpqAriiaHkD47AhhoAThMogSu5PIbOA1uMrriLcSGDehxTYno9icJIMHSOK
	/kduB9coNCr31Q6L6quIOZwnL4BQnQRmXDW3toO9Rc346FWwCEbn/V1PvJqrqQNWzEzbtTYftf8
	kF12f1rPg27epWw+yoj05miW67HFAB93PtKIv3kPgdLiycEyyqyyqXuJCHLv28+qIX88eVIXpTc
	Fi2oHmWshtO1v3PiuBPMue78lu94W6rdZx69vc0+6UT2jKcPLqPS50fEYFnJ5kD0QNf/h/CAz2d
	Q2nUSsU5BzEX2DNnH4DmZbF4onl7lIopFDbjK4FKTFkWM=
X-Google-Smtp-Source: AGHT+IEZgH8C3X2hKHFaGk8m/sj+wXbz4vPJ51iPhQv7rcnwmjwBtTIy55XTg/nxIWcxrRVf5+4t4Q==
X-Received: by 2002:a05:6a00:a381:b0:7e8:4433:8f99 with SMTP id d2e1a72fcca58-7f6694aa45bmr1178150b3a.33.1765523408660;
        Thu, 11 Dec 2025 23:10:08 -0800 (PST)
Received: from [10.200.2.32] (fs98a57d9c.tkyc007.ap.nuro.jp. [152.165.125.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c4aa9b56sm4327224b3a.39.2025.12.11.23.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 23:10:08 -0800 (PST)
Message-ID: <f8c5f2a6c05c5a24076aa39fba7a45d30eb5334c.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 1/6] resolve_btfids: Rename object btf field
 to btf_path
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,  Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend	
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev	 <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier	 <nsc@kernel.org>, Tejun Heo
 <tj@kernel.org>, David Vernet <void@manifault.com>,  Andrea Righi
 <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, Shuah Khan
 <shuah@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt	 <justinstitt@google.com>,
 Alan Maguire <alan.maguire@oracle.com>, Donglin Peng	
 <dolinux.peng@gmail.com>
Cc: bpf@vger.kernel.org, dwarves@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-kbuild@vger.kernel.org
Date: Fri, 12 Dec 2025 16:10:00 +0900
In-Reply-To: <20251205223046.4155870-2-ihor.solodrai@linux.dev>
References: <20251205223046.4155870-1-ihor.solodrai@linux.dev>
		 <20251205223046.4155870-2-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-12-05 at 14:30 -0800, Ihor Solodrai wrote:
> Rename the member of `struct object` holding the path to BTF data if
> provided via --btf arg. `btf_path` is less ambiguous.
>=20
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>


