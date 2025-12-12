Return-Path: <linux-kbuild+bounces-10076-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 200F7CB850D
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Dec 2025 09:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 963D2307D340
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Dec 2025 08:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662F125A33A;
	Fri, 12 Dec 2025 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m705FxTY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19E530FF3A
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Dec 2025 08:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765529199; cv=none; b=W5h/7YjdxW1UHRsvejGg/MP8xaYf25aDWjW0suGiKLabaPqQDTM5Wl2Hb17h0bT89HwcteCAIarpRml0wfSyinGueOqpOImmac1zlWw9++/+Bo+BLi5JaBz+S3NAk1hGBfirB1fhLyeBovTye9T3u0/yvtx944ber+C0RlAWci4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765529199; c=relaxed/simple;
	bh=JKozA+ihNq4x4Z9RrSdTKWeKEiQ1xyKxK4t4W67sS6Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TdrmSDZQ789dNLSLeQiznLfsF2m2biHKcpel/jDUg4yGVibMjvk5yUPa/cdmnkfczfzXl943xdHKuRJnjtNioktKvaqsq4R8Z0tuxKJC88NoMW4M5SFYohC9ye/SzJb9ZhB4aGGbN/O7UJKbseF9qQ2tHKvjVeI96c1yI6p7ugE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m705FxTY; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7c7503c73b4so543052a34.3
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Dec 2025 00:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765529197; x=1766133997; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JKozA+ihNq4x4Z9RrSdTKWeKEiQ1xyKxK4t4W67sS6Y=;
        b=m705FxTY2GrEQpfT04JvBSNWZfcuHkbHkm9uVMmCOEf6exAa/cygowUOvXyZWxqlmV
         +BjxraYRWxU4Et5VFn3zJwFh+6vfJLNGmxQ6EpzEjKufo99wx/MY8rXyvFZUUurWx5Y5
         EV/l8aEM/bBvWNGu0EnM6e7lmWB0SNOD6Q0bwx/fj6HUoDT0pMAu97fjQA8IvXvCwTNI
         bT1zlRzaVPJH21eL4IIsmUCfmoKNR5FYIYEDDnpotccbgIkhsFUg7sqwdLrfhQFF6vpy
         M3l53dnRmtzU/6QPV2DrBJEFbvNMh/lpWMJe71Qh/v47UXbX8PQztVEQlJj6SV6oUGQd
         bEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765529197; x=1766133997;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JKozA+ihNq4x4Z9RrSdTKWeKEiQ1xyKxK4t4W67sS6Y=;
        b=nUfDRLnOxf0/0kzQOqZn5D9HBso1tiRG5mzk5o/vc6iG9MogLTHAglKKRwH9MchjR+
         rQeskTROjdKY1sWjYMDqMkrXugBaUxm3MWGzdreW701YRDclglx31o6bpN+DzyFkLfRB
         aOG2/5cZU+TY6dScpmZ0cFC2c9CH8BR2YWd1BAfQiqRlAqexyT3qd+b4z4OI2nkYzThf
         2gpNRt+pzmHRXXr3AwlS+t3h+Fz7Z+OYmTkENpVjsXbhJ72lFAWa8Pxl6DCGbjHXhW3K
         XAZE/DnhQjhG+OFUoIdJGl9q9mrAVKJuFNhd2h36uuBaGxz7N2e7aluhuDxDtmTzDEIu
         Lwtg==
X-Forwarded-Encrypted: i=1; AJvYcCUPf/2rHth1kYr2hOTjkscBTuhqMYfdngTDBPU3vcUocrdM9OUNxd8TJLxH1YSlxPasL2M7nV9t54VMero=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVOD+BeEijwfnPJwdvCtwNbynHoyxaqF3awhWGfU5qQbK+s7ee
	0HDCp2ryNQlUGOpUfT1HwYcWeD/eX0ghU1XWkQu6z3QPjWNJTSc3rlDHBzJO3VWd
X-Gm-Gg: AY/fxX77wUbzM6eyb+xS4hQL+LlkBDTDLbxgUu6xPFdy+C9z7iknvjm84Jcdr5Bh7NA
	jftKB23/LTl4Im6IR0ZlNgtbdhHaXiJmxEUBsVa/CAodgtr/mPkKVetDIYTQCek7xeTTjMCS5kQ
	kf2lVtlsej0VjlGaR8jbwhvMMTp7cbkgodIXg/HFz1u5Sn4AQzQPL5Jiyys6v1+Gfi/PZQ+aviA
	jVfAR7xbmZQHq78uRkEPiUtsWPjpOK2GNwIDcXyUXj39V3eTM9eYgojDofgN9pmbWyb73FADzVa
	ZWiztsVjrzG6jzTYg7AcqRsSbKo9tDeW0cfxAsntq9W8FNzy3snbsaEOobH+s874qQYFWF5Y2IR
	DMMzHvMpVgKvz3Tc+P87lZeHlp5hb2C7QIdetkbk0so+A0eDKWEDGZ1YJ+LA1o5y69HUSwHa2z8
	v6a85Be8wKETVBOdhnVkaQQ57H0gkL+S4LczxzBNaR4vsEaMlQfosTLA==
X-Google-Smtp-Source: AGHT+IH321PbFRiMaWCDNl4lSGVuS0AwL6lMd2u2Ei57eaf0ISIe5GTqG0pgY602LItAKZZCrdasEQ==
X-Received: by 2002:a17:902:f686:b0:295:9a46:a1d0 with SMTP id d9443c01a7336-29f23cd7cebmr12297065ad.45.1765523389898;
        Thu, 11 Dec 2025 23:09:49 -0800 (PST)
Received: from [10.200.2.32] (fs98a57d9c.tkyc007.ap.nuro.jp. [152.165.125.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29f2e40765csm5138155ad.0.2025.12.11.23.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 23:09:49 -0800 (PST)
Message-ID: <e509afe94b4492d64e27756f4db773b7a179e994.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 4/6] lib/Kconfig.debug: Set the minimum
 required pahole version to v1.22
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
Date: Fri, 12 Dec 2025 16:09:41 +0900
In-Reply-To: <20251205223046.4155870-5-ihor.solodrai@linux.dev>
References: <20251205223046.4155870-1-ihor.solodrai@linux.dev>
		 <20251205223046.4155870-5-ihor.solodrai@linux.dev>
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
> Subsequent patches in the series change vmlinux linking scripts to
> unconditionally pass --btf_encode_detached to pahole, which was
> introduced in v1.22 [1][2].
>=20
> This change allows to remove PAHOLE_HAS_SPLIT_BTF Kconfig option and
> other checks of older pahole versions.
>=20
> [1] https://github.com/acmel/dwarves/releases/tag/v1.22
> [2] https://lore.kernel.org/bpf/cbafbf4e-9073-4383-8ee6-1353f9e5869c@orac=
le.com/
>=20
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]


