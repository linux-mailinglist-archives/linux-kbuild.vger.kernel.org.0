Return-Path: <linux-kbuild+bounces-4532-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D24F19BF638
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 20:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A9D51F2230C
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 19:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92716208235;
	Wed,  6 Nov 2024 19:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b="FlCO/gpu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B0320B1E4
	for <linux-kbuild@vger.kernel.org>; Wed,  6 Nov 2024 19:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730920732; cv=none; b=I1RSgkxO2tQoDbnWOfHaxPSViA8LTFJcVLBLVJbySc1Hz0nYBN3ZE+I8CCZJ0X8v+BqMkZ1wLUUcP6emlg5eiBuW5Xbc7HUqzsFP6gSKRvGLjS1yXGkY67WJVqSzs+u4ZQ9GHTXYCQsxthDaP3D7uOO5PAIlwZT+RG8pVok9jEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730920732; c=relaxed/simple;
	bh=qOe1CXVlc6MFF5iYmoeU/kZHwPZE0z1YOhnSZJKpHWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VHwhNCW3F7YF5Bdy+AK7lWJceuTbdina7Y9EpMbVHbDdRtas4dAjETcK9iveRITGbctVdqMnNBshr+jHBOKmIfEpP226vs0/AzkdVIlFYxU3gHzS4VpmXIzCnvFkjNKFi5B3jOiSXxPWDJEb2bVrsQLEMo+DoqCvkbT12Zz7o+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b=FlCO/gpu; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d4ac91d97so80410f8f.2
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Nov 2024 11:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20230601.gappssmtp.com; s=20230601; t=1730920729; x=1731525529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOe1CXVlc6MFF5iYmoeU/kZHwPZE0z1YOhnSZJKpHWc=;
        b=FlCO/gpusn+K3rcuqWi3P3idxngUitO3mwKanUvxtlqIGpFCSRXytHOo4RPMBk5DgF
         rKPSRjexqJB6yInovLZIbEtzGBa95unkLPlYRfN2HlOP9dDFZii6fYU8RvzmvG7SfxlP
         ObaAMUyCz+kb2x7JjCugdBSqs9GfwzhMbSNekcNooWyeridXewt2oU1bAE1wx8NHylYT
         DHMzG2DCw+bBcYE3zqIl7w7rRIsmj7v10Fd2StgzG1XtCX2x8BdODOx0EYT8y7G1hNvG
         vrb0jsbi4wfsgL0QlYFL/N/HFY6evAkAw23RnYZvNszvMnLnUWj/QakLvoj6pUoEPtjn
         FRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730920729; x=1731525529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOe1CXVlc6MFF5iYmoeU/kZHwPZE0z1YOhnSZJKpHWc=;
        b=YXc3pANmbvoGGaLLhbCBE1VQAgjUOJc2q3Qqcs7EaN43lLCtIOlUw1z/eRoJCXWRip
         sbqClj+ztnp9/3+Upqxlq1B2SwOTrz9O8SzZhui3JNdZy3D/jao81NAfvOVSfzugs5c2
         EFYbMasOLWpjlrjbOeqNU7aidOjKM34LQ1xHDkjwW7MMCyiJJ2otPvMoM1XyjTnT6Q3k
         uqLtcpa8DO1xjvEFoziArGD4C3MuZkAR7BClMQv9OPQQi6aLd3QCaNaw1ia5RMQY8HaC
         csUSpanRGRCfCuEqQNsmUTfiPmbErgorM/dGIhSyvJVXcTv97Bopu/cEBhlKkiqOd90I
         M3zA==
X-Forwarded-Encrypted: i=1; AJvYcCWbJAMBLas6Q6HSWssBi5eHQq8oy0gWdfze4U6UuT2C/XRDCfgpSwNk/TAjaJylakqMrIPhzJ3PPpC0AC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKcA5+yw6QjVCeZSX8u41d4zGlMDZ8MMb7vG6idGzPlQJ1zYv2
	WjFseMolUJAPP44bqu+2p6Bj0+0/gyYlG6dz7hF31btJa0TcbiqqI+WPR9nMnAs=
X-Google-Smtp-Source: AGHT+IHIfvSuVMYE/OJ5z1Vf/8NWtnI3qpI11qZI1ZDjCQ5R1eoen0eQA7m2x6FHYRcVHKNghMdtTg==
X-Received: by 2002:a5d:47ac:0:b0:37d:48f2:e749 with SMTP id ffacd0b85a97d-381c7a4636cmr20971751f8f.10.1730920728680;
        Wed, 06 Nov 2024 11:18:48 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac1:2880:f0::179:1ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e7387sm19855419f8f.51.2024.11.06.11.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 11:18:48 -0800 (PST)
From: Matt Fleming <matt@readmodwrite.com>
To: nicolas@fjasle.eu
Cc: benh@debian.org,
	justinstitt@google.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	masahiroy@kernel.org,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	re@w6rz.net,
	kernel-team@cloudflare.com
Subject: Re: [PATCH 2/3] kbuild: deb-pkg: add pkg.linux-upstream.nokernelheaders build profile
Date: Wed,  6 Nov 2024 19:18:46 +0000
Message-Id: <20241106191846.2079521-1-matt@readmodwrite.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZxkYYLbiXZ3p59iu@fjasle.eu>
References: <ZxkYYLbiXZ3p59iu@fjasle.eu>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hey there,

Can you explain how this change works a bit more? This reads like it's now
impossible to build the debian linux-headers package with clang? At Cloudflare,
we're using a custom build of gcc, not the gcc-x86-64-linux-gnu package, and
with this change we can no longer build linux-headers.

What's the solution for those of us that want to build the linux-headers deb
package but can't install gcc-*-linux-gnu?

