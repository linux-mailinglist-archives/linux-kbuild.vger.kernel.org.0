Return-Path: <linux-kbuild+bounces-9302-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 11122C1A58B
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 13:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 561B5585BC3
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 12:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63EA36B98F;
	Wed, 29 Oct 2025 12:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGtTCmkK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E905E36C251
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Oct 2025 12:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761740610; cv=none; b=GvpSxWE6ZDsan8+Y8Ix/NCX103KsfCN0AvIwojoT3pMX6FGn8Bsu8UnG/Xjp0s3AqgYysKAr8R0+b8+67zPozZ8NSc8vlqtyPFdyb5WLSchl7BkRviKuI6YHsR872jl+7I1po7usSRGKzdX+fsXlT8SMvve0SsaOonlwHusJQfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761740610; c=relaxed/simple;
	bh=GHebTe5G7CtxFjuUCS9MwRFp7u787YUWK2Q8YSzn0h4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1pLc9iSy751Unak+M9CdNSA7mqOr1CQEz5mvdNzXzoB62mgyFN5fnaKZGFoZf0ArxoDBTdv21tmCEhKssqpPQDGX2P4ZApVdFVZ/obc3t0eIV+exF4JjtMyUQ0ejM1vjZVfQ02Q8kJL5YBnqBLrQq5GDydqLtUQfSmyzDUMnac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGtTCmkK; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b6d83bf1077so490054066b.3
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Oct 2025 05:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761740607; x=1762345407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDFNzSZSOfNylxri3WZM3/PhA4N5a3TRvkg+xuhc0cY=;
        b=EGtTCmkK+O5AbJ0OrfL97xbKPG1YZbEl6fWoRYbbt6DLisXk/zQgbqQRVtyRSoVPTP
         avQvhrrLi1XXOH60dcZx7EjWNQTMoVx2Z627es3gKfVRQ63ioLXZT5jnlABGI5KeJnX7
         AzTeUUt6+3fq7esNdSkpYhC+Au8jN5NN9se8mmK3niyE3kOZW2BrdOwcW/DqfsXGYiS3
         kApjy6Tjydkc4lD6Ungxo2kUJWaoQvEVsAp5Bz/hhbuWyzxygURwUfVNI0yA5hVQmyR3
         kU/Xj4/4pdEk5SveSGhPVsZfnAvu+bVIuuYIKhFGpmbzc0LvNVmnwZe/ABZhBgodcrDm
         hWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761740607; x=1762345407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDFNzSZSOfNylxri3WZM3/PhA4N5a3TRvkg+xuhc0cY=;
        b=FyQok8L1T+MRA520WKU0c9JAxdw3nXxLqXy2UVkq0A4c/Envr9pmyQgRMSbWW0L9Gt
         N3F0i8vNNREb0TvD86Q20UgAErErGd17sJ+bWR8KRZtgVm8pHjUkMjMEXjyJJ2JvcHKO
         xJgz7yI0OevahSJNnLOEAwUA+bN/z+tXQF6ZzXQNa+ocMcH9xyne5YKssQrkAFE6TOJ8
         HGWR7h7WnPABPk/YjVjBKiJmeoYJjXbX7ztJ701CjU/9xH8sHgzcWSpMHZmcB8/Xc86S
         cop8v10yVtAoXdomRfai9pTY2OFGHkd5x0QY+N3EqE8lmxG8QRhiagVr9ifQej334JMi
         sOGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmjTPEE+VXo+hizqslS+Yj+7LtMKybA5PvWvym2vo/3TPoi3oLrAByrJi+4WOJmeZyMFZtU5X6xs4MsnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDGnGv5OmNNFj8RNSYbSOzz8QbjkNBlXvWzjmf7IwZmYdK6oXe
	Wr42fydater2xRH4KYD57Q7tZDpvSsshWAixvJBiQyGaCi+DnK6/MlRG
X-Gm-Gg: ASbGnctueudAr+KrysT7pNoydx/FWMFViECAUPprqgt4XPgKxChWYrnXUNPh43QivQI
	NMR4GdsDaF2RgUUVut/NHTNA3KaDKKWKWrsZd78oqRS+iMt6du9Kr+W32ZgdJSP052zQqKnKkRm
	tKNH60Mig1Rb0bG2zOwiWxzVTl78a7gBEOJeTN4FnSbyKJoVByr7nGmKtmmyIBgOpqfKrcuieH5
	ud+QdE2wVQpyc/pzrPDF/WPhQo0K0kG/ENJJrLXBYgsSZ2dflJNsPy39hPrTPyDhMOYivD5jtqr
	oFR74e3BwNhmEpHsbOIqJkhFdT5ZrPCKOTtgbPtFNDDAaq359Ma8xUIpuOL+e7KzeimjzX4Jqzr
	78hD3Gsi1HdQd5rruMTzetBHvYICyu8BVUtFwR8i2Hb0dxLggYtz+kXkOENKaKqohLHGnNrC+x8
	Wr
X-Google-Smtp-Source: AGHT+IFZ92S7NaPGWXm45s0LWGTqMNYg+U+gNAWRIpECOO59GP6wM/kQVqXjgCnLzIvK7qpJfcLAlA==
X-Received: by 2002:a17:907:728f:b0:b3f:294c:2467 with SMTP id a640c23a62f3a-b703d2cdea2mr273434766b.10.1761740606866;
        Wed, 29 Oct 2025 05:23:26 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b704d7a9867sm39889766b.46.2025.10.29.05.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 05:23:26 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: tiwai@suse.de
Cc: Dell.Client.Kernel@dell.com,
	amadeuszx.slawinski@linux.intel.com,
	baojun.xu@ti.com,
	bo.liu@senarytech.com,
	cezary.rojewski@intel.com,
	dxu@dxuuu.xyz,
	kai.vehmanen@linux.intel.com,
	kailang@realtek.com,
	linux-kbuild@vger.kernel.org,
	linux-sound@vger.kernel.org,
	masahiroy@kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	patches@opensource.cirrus.com,
	regressions@lists.linux.dev,
	rf@opensource.cirrus.com,
	safinaskar@gmail.com,
	sam@gentoo.org,
	thomas.weissschuh@linutronix.de
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA: hda: Move controller drivers into sound/hda/controllers directory)
Date: Wed, 29 Oct 2025 15:23:21 +0300
Message-ID: <20251029122321.2872-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <878qgvgrk0.wl-tiwai@suse.de>
References: <878qgvgrk0.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I just noticed (when debugging unrelated bug) another thing: whether audio
works depends on what initramfs
generator I use. "initramfs-tools" vs hand-written one. So it seems that
set of modules loaded by initramfs affects whether audio works.

-- 
Askar Safin

