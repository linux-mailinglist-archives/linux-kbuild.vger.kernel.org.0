Return-Path: <linux-kbuild+bounces-5884-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D31F9A42CCE
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 20:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4F191748F2
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 19:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DE21DC19D;
	Mon, 24 Feb 2025 19:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="TKe0k6QS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467151EA7E9
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 19:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740425703; cv=none; b=Z907+Fx+Xkve+5XLnqk5Wg9rDpiqDG0IC5l+3ozR0egJ+tVxovO61rXdFOWuYgiw9+trlAt5QDmqcoip6r2MyOfzaePtQACKZetvuIds/ZX8Go5tmZx2PS+9Z/lNx1m29tj5v5FPovaIyryaxzKpL34Xo3iHjlaj+ZDlbg/6iXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740425703; c=relaxed/simple;
	bh=9pSl4UpUltApWCkaB2TQU6IpD04bsOyRgYCWjHq9QwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCYx+WjPlD69fNVUQr9kQce3eOKsrw5Iq++ItePmmVgq3vk2/qCvAkJhKUrUgZA+2Dx/GlWfSN1TWNYfdUjut3wlRK+IPBZrieTU0O5zS3enUIwVgIwv6F+psMvF6ZpmpvZEftRHqtb85grPprjDk6XXMRTtbU2g4kQyg3EcPJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=TKe0k6QS; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-220bfdfb3f4so107378695ad.2
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 11:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1740425701; x=1741030501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9pSl4UpUltApWCkaB2TQU6IpD04bsOyRgYCWjHq9QwQ=;
        b=TKe0k6QSBbcLWljPAqk2LHJsseAL2iiE57aDD/9Sbo/rq9jLIidy7b4dz6M6+SqCuh
         FRMpdZSOH4A80mMkyrtdjKRvXtk9DM0VfUTTAN40uMB3VXIDqeb2vOhCJwXbLcypjDRp
         epy3JV2th+OQZDE4y6ZP4zZHa7psnXEAZx/JgtGpyN11AMYCidCmZSwXdQ42jSDg8UfP
         4iFMvd6ilNF7yYjRWdat4FjsNAS7TzT3J1A+9apqpFmUFdM2GpAGg3VrcWeWjjX/GP6G
         nR9fMbPkM59AxyZY3lcYcGJ+hjtDzY2rgove1QuWwnoqmMJd0z1ooH2rWAO4ewQeNKJz
         BSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740425701; x=1741030501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pSl4UpUltApWCkaB2TQU6IpD04bsOyRgYCWjHq9QwQ=;
        b=UNRbeKvqL3RSO0uIroa5X9WIopciEevlraPm3/2vIQPM/1M4xuMWJrInx2QJY6weMs
         viHpYUotB5faXUjWp7hfryj8n/ADd2d5UJyWv4yDYkZxvatYyr8KucQF3CfUPfxPI6i3
         RMXSmKH59H9CeO/q30oQnaVX/yU4n4XvqSubw0FcxH/DtfzkDXVJJ2r3UDxugrkLeB6G
         /vV3wWNfDkO8HhebOVs/unjgWdmx9mVApWtQWugnw04iOP+TQ4Wzubp8DdQhDKNGTLRB
         c1pz7V7xOpGdbj1HaaUjKyoJpJZI0Ukw7YmapMb7u69TuJl1DHW5oFtq6gwLvM2bgTnq
         r8EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkGAcUt3qW8Xw+mrIgSeSsH8/0s91z8I/L85mtfnlakdP2cZFDguQA3vC5JE0+KFfoKFzSGr0Inl22J4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlecJ3ForkssKrjf/ZBIi5yay1/Ra/Bk4lDM7zGKC91p95Sb+R
	Ryl1/3xnGQa0X0egbgtxIg+yWzfoDpEiAgKKA5lGlkGfbKZXZgrDsxZHSEeE925otDheC7NTM/8
	7kgkk1f0jIFsPXehIHhqtRzy/cJW88Fem
X-Gm-Gg: ASbGncv1+5ob+8FOqaJUc52++RF0BE6v/tOCEgss6mJLHoG/7PohGJEhxz/axJfyIjk
	dGijoxgeCkD3CApBMGffFHg9NnWoLwrRo8yqeMYHEEZPJAkyKuVSB4CzfwKphKSajXuwzv0kgE9
	QthmRatHOfyMtazk3oz+OQ/dJMYkaaFh0egA4AqZP3YHqj9ea+RZK1nPrqbjYn0+6uoNOv1C61A
	VeSIn6dYx0I43hMOvOzL1b2cxSNdFyWBtjFY7KMbG+NMumyq+7E0im1Y5Q0nBfZJE+pRDr8AVIQ
	dz51vFcnL73wAGgB+W80byQEqWWavpUML6lz3BKTuf6U/tQD4g==
X-Google-Smtp-Source: AGHT+IFmkKPAJexMZBFCuDqSF7cUkV55id/jBHYO/SYW9uNccAYqjX1Ep8ynNrqPIS1as9sxoALbH7LjPbML
X-Received: by 2002:a17:902:dac5:b0:220:e9ef:ec98 with SMTP id d9443c01a7336-2219ff50d25mr225280065ad.19.1740425701534;
        Mon, 24 Feb 2025 11:35:01 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-220d5324f7fsm11616215ad.56.2025.02.24.11.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 11:35:01 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id CEC243401C5;
	Mon, 24 Feb 2025 12:35:00 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id BE5DCE55EF8; Mon, 24 Feb 2025 12:35:00 -0700 (MST)
Date: Mon, 24 Feb 2025 12:35:00 -0700
From: Uday Shankar <ushankar@purestorage.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: rpm-pkg: improve debuggability
Message-ID: <Z7zJ5EjIFLbz9C3I@dev-ushankar.dev.purestorage.com>
References: <20250210-debuginfo-v1-0-368feb58292a@purestorage.com>
 <Z7Pv+hD3AOS/ymFI@dev-ushankar.dev.purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7Pv+hD3AOS/ymFI@dev-ushankar.dev.purestorage.com>

On Mon, Feb 17, 2025 at 07:27:06PM -0700, Uday Shankar wrote:
> ping

ping again


