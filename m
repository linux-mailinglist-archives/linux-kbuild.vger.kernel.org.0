Return-Path: <linux-kbuild+bounces-4649-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E52319C4B24
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 01:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80EDA284797
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 00:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3C71FE0E5;
	Tue, 12 Nov 2024 00:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EcMYPIg+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6015C1FDF9A
	for <linux-kbuild@vger.kernel.org>; Tue, 12 Nov 2024 00:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731372541; cv=none; b=YcxuE4T56NAPYPDIkq0UfGuYvBkaVjaJfa5ciB7WPQd1E/XTQuuLl5w0+jG6eNyf8fLYmCzpRR+h0qzZKLb9oqIiy0iycoTaNCmU+8vx2ZAebSZldftsZqSkYpAnvYjysi/TrR75rdAulnJ6x2RETPAmbD4tod4RrRo9hZnR6+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731372541; c=relaxed/simple;
	bh=kYrzIGpGTAdZ+l/frIKwRSqMzvZbvhwJEEu4sv0ER6U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iOJX8JhoTxoEpdqBToZGut0uuaYgxoqhveObe68nzGV4Ah8T2wS6iGEabi1ULX1O0Fg4kNkfwoKTsa+DbX/atm49sBjsi39nAf2J5dSKgEJTin31SvkrAXaQwjyHYiRbJizWscwVirXigD/xjmi8XHZfs83PG6GGp4ucRhNvxZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EcMYPIg+; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7ee6f829458so4651363a12.3
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Nov 2024 16:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731372540; x=1731977340; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3d51sumdx2ObGqeplCpCcwVtIOlKxVMh1GOKKAkQVA=;
        b=EcMYPIg+xSc7sZ97E2Y6WDQ0v/J+eSWuiVvDncScmx5/fqlTieQo+ayOjaCIstZHpL
         vLiDy4IzwCmaCJhKlIqvtdMPs2c3Rq+JCmkB0VEz0y/k9Ed+2D1jqjzCXHNkTAnWfOh+
         oovIV9E6raPuREhYznWvVsmzS8v6dN/F7ZID6aZYWafq9I54N52xSZLTR1VQnKM9JERd
         MSG2vPO/c4gxyBPd9kgrEvtAKoRkotO2W4g+/KN3Nh5ktkrak5C207ayp2bxqVgtvhIF
         4WiDAfPULUycGJOIniCX+n+yerKMVea8HCi8JNNPb8Ie0kB5Vc4Atls1kvNKpROzaxcN
         HFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731372540; x=1731977340;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V3d51sumdx2ObGqeplCpCcwVtIOlKxVMh1GOKKAkQVA=;
        b=ftzkVYXg+q1JWLMNsdqfxg2NS/h4XYIByx1pN67ekfitYYv0ebyZqJ+ogk6kcgXioq
         ayhLb8ceNF/VsMpMuhDo8wPX4/n+ea8IgzGeuV75I6sZPPoJYcfqDRqpYvxiu21S4CWM
         ojDh+pgv3WjkExyEiGb5CKdinOVf5zGVlWs4LgxVsD5WL4Ztg/S9Wh96bkftcJriKN1f
         yiqy3hfqmaknkcsm5D8N7xp6CxdhpjxCg9JN1sAnnuR4G/zJO5pi42n24Xr/Qylb2iwD
         NqP/q4Mrbp9638pZbgbIwW3D6hIjZVg9x4nFX48F52y6/Xi4xlki4LKXzDxl+09d+fcr
         VNlA==
X-Forwarded-Encrypted: i=1; AJvYcCU6YLeE6Pl0612nrqpPifou3xeoJMnXP12stuCJtdF0lUcdR8Z4Xse1mKEP2RsXJZ0XAtthq3UrrFFXHL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyArN5ZrRCrMV5l8rl3jGlSBTW18pF/34/z2g08JZfJ/C8IQYJT
	vtG4iQcq37K3ic9wWvcszgmvfO3h2/G11wkOqez9yvP8NE+2iP/riys48oFyx0BfhFfuqGezJVz
	FCg==
X-Google-Smtp-Source: AGHT+IHlyWiwcxXqbhz1fA8zTtz9hHIbjIUyo1Hj8c0N93O+44mC0qg7F+KmIsWLl9LBY634Ti3J8Ix3Z6M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:943:0:b0:6d4:4eea:bd22 with SMTP id
 41be03b00d2f7-7f430aa4f08mr49656a12.4.1731372539660; Mon, 11 Nov 2024
 16:48:59 -0800 (PST)
Date: Mon, 11 Nov 2024 16:48:58 -0800
In-Reply-To: <20241111105430.575636482@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241111105430.575636482@infradead.org>
Message-ID: <ZzKl-ldUQD9ldjWR@google.com>
Subject: Re: [RFC][PATCH 0/8] module: Strict per-modname namespaces
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org, 
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Nov 11, 2024, Peter Zijlstra wrote:
> Hi!
> 
> Implement a means for exports to be available only to an explicit list of named
> modules. By explicitly limiting the usage of certain exports, the abuse
> potential/risk is greatly reduced.
> 
> The first three 'patches' clean up the existing export namespace code along the
> same lines of 33def8498fdd ("treewide: Convert macro and uses of __section(foo)
> to __section("foo")") and for the same reason, it is not desired for the
> namespace argument to be a macro expansion itself.
> 
> In fact, the second patch is really only a script, because sending the output
> to the list is a giant waste of bandwidth. Whoever eventually commits this to a
> git tree should squash these first three patches.
> 
> The remainder of the patches introduce the special "MODULE_<modname-list>"
> namespace, which shall be forbidden from being explicitly imported. A module
> that matches the simple modname-list will get an implicit import.
> 
> Lightly tested with something like:
> 
> git grep -l EXPORT_SYMBOL arch/x86/kvm/ | while read file;
> do
>   sed -i -e 's/EXPORT_SYMBOL_GPL(\(.[^)]*\))/EXPORT_SYMBOL_GPL_FOR(\1, "kvm,kvm-intel,kvm-amd")/g' $file;
> done

Heh, darn modules.  This will compile just fine, but if the module contains a
dash, loading the module will fail because scripts/Makefile.lib replaces the dash
with an underscore the build name.  E.g. "kvm-intel" at compile time generates
kvm-intel.ko, but the actual name of the module as seen by the kernel is kvm_intel.

--
# These flags are needed for modversions and compiling, so we define them here
# $(modname_flags) defines KBUILD_MODNAME as the name of the module it will
# end up in (or would, if it gets compiled in)
name-fix-token = $(subst $(comma),_,$(subst -,_,$1))  <====================
name-fix = $(call stringify,$(call name-fix-token,$1))
basename_flags = -DKBUILD_BASENAME=$(call name-fix,$(basetarget))
modname_flags  = -DKBUILD_MODNAME=$(call name-fix,$(modname)) \
		 -D__KBUILD_MODNAME=kmod_$(call name-fix-token,$(modname))
modfile_flags  = -DKBUILD_MODFILE=$(call stringify,$(modfile))
--

