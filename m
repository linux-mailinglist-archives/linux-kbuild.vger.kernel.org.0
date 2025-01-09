Return-Path: <linux-kbuild+bounces-5414-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4A0A07759
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 14:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 320C91881D2C
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 13:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8179218EB0;
	Thu,  9 Jan 2025 13:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ilpirodf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE14218AD2
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Jan 2025 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429302; cv=none; b=MODnpeTcqO7bIt0eQ2MXKi6eGQMgi2qWyW7gyGTHwoftdtSc394uUMSnYLdA20pInN9YZQ2P7wXpypJyD7g74WkUiQrrtiBJKR35o1KjPNdMugYEzdefvAVN1XByqwg8DN0WrRtHAF/knY1z8zfqasuPXxO6Vl89K1H8uhG3+t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429302; c=relaxed/simple;
	bh=MsUy1NGWXbake+FcYoGPXSrG88cFtjm23PvE7aMcI7U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t9r/ptRe4cs2j7VfoiNJCe36gazMdhsgHqbV5KgojHnbF5lOFBHlKZzHfvVAdq2Ig4O6iw+E87P6nTjcl9pqPe5VnuoLYyGZDSFUVsJOw5zr6lQuToUiDitTatCyyQ/rcmbaMzg74Uzd531OwnOWN57jMcRRxScy2i/TLp89gR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ilpirodf; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-436723db6c4so6158855e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Jan 2025 05:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736429299; x=1737034099; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MsUy1NGWXbake+FcYoGPXSrG88cFtjm23PvE7aMcI7U=;
        b=ilpirodf+Y5T5KRV7chztz3Bh2ftmcOd3ojQ6UEUBBn+YzKNNyH1m4JBa2xIABbqAD
         bVYiVqQx+6omf+rXmx3BIN96Q4CztVb3ENAUhWCWcFLvTvyd6rLIuDT6C/XYRLMWh5cO
         1lfggTjbMTHwLU57M+epaFQRgABGTUZh0wxl1Uywzq1GoRlrSKo4uWnaSXcF4HCmeDVJ
         JRqkNi63ZzlM/P4Xlz0+EFIz8ZtWMTQq+kPb8oMM+SexlLfNtf09EYlVaXvA3oUvQ830
         tJ2m4kordLXhuSjaslG7kv00st/KgfHtHfSrr8gu7xK8mTc0u0MV5SDePKw2FZao+p8x
         kYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736429299; x=1737034099;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MsUy1NGWXbake+FcYoGPXSrG88cFtjm23PvE7aMcI7U=;
        b=U42KOG+30PsnTB+Ix+a0Z/qZjSqTvhhmeCK8qJURyLe/7tKmtsYhnw84WDmD0sAi8S
         D+yizrNuDt8dMuwn0oxkKNTJ4AJxRXREZe6T0bw6kekNDFzTaWyWl7bkaxdblTFqnaZC
         /jUBRIRF+LH39au4ks27IMte4ZJKyux9hjtNagiAaIbZXX2OoxNsxG5olQnKvA46JCKA
         ky02nShwLZeqTgqNxBS/bKGSwKwL25jbLs4NxOyPmeXD8XM1tzLkoBD2n0zpjcwvyOnQ
         s46uExk5/KBVxjtLSbUnnj6rQExNioEylMSgzytR9ojm34mmqiis6+t460bPNDiMqXyz
         Z7rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJYVKk3KQ1t35noyfFxa2cdJOeHbBj2FD2hOM/Fbw0MILRBtBabU3leW+Z9NegcLCdiBwj79lHCQzM4Wc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhgD97Fs2sEh0UVH2mZ3hEJZHxk/QVMXmcH1t2fO4igNz1qRYO
	Vfhc0lk6H49PqCbFMO8F0yLGZqLxfTmL8/z3xrkvoV9a+p2dwLNR5mnULRw4wk5nn7rrUChm/N/
	SX5GYX6Um+w==
X-Google-Smtp-Source: AGHT+IGS+ykuF+WifsuNU8fs6f5NzvjfsZaGXQuMDAagkQiJizBEHS+g8siVUuZG0a7A17mkD2CuIIwKfY2n5g==
X-Received: from wrd8.prod.google.com ([2002:a05:6000:4a08:b0:386:36e7:f43f])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f85:0:b0:386:3213:5b9b with SMTP id ffacd0b85a97d-38a8732c132mr6915547f8f.43.1736429299532;
 Thu, 09 Jan 2025 05:28:19 -0800 (PST)
Date: Thu,  9 Jan 2025 13:28:17 +0000
In-Reply-To: <20241028034949.95322-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241028034949.95322-1-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109132817.1426138-1-jackmanb@google.com>
Subject: Re: [PATCH v6 01/11] kconfig: Add PicoSAT interface
From: Brendan Jackman <jackmanb@google.com>
To: ole0811sch@gmail.com
Cc: deltaone@debian.org, jan.sollmann@rub.de, jude.gyimah@rub.de, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	masahiroy@kernel.org, mcgrof@kernel.org, nathan@kernel.org, nicolas@fjasle.eu, 
	thorsten.berger@rub.de
Content-Type: text/plain; charset="UTF-8"

Hi all, this looks cool!

> This support is provided within xconfig.

Sorry I haven't read properly enough to be able to answer this for myself but I
suspect I'm not the only one idly wondering...

Would it be easy enough to provide this support as a standalone binary that can
be called from scripts/config too?

Personally, the only reason I ever use xconfig (well, I use menuconfig, but same
thing) is to navigate "conflicts". If that problem went away I'd have no more
reason to open it except to access the cool SAT thing, so it would be even more
convenient to cut out the middleman.

