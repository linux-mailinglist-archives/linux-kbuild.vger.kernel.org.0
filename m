Return-Path: <linux-kbuild+bounces-5615-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBE6A26B46
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 06:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E1CE18857FC
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 05:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEB625A624;
	Tue,  4 Feb 2025 05:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPk0frcR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A5319B5A9
	for <linux-kbuild@vger.kernel.org>; Tue,  4 Feb 2025 05:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738646446; cv=none; b=kXZdOF7MRHZk1DUBehIIqK6pm775cFfBKHJYdPQJrquXtAjpf09uPlLsYSS8tfTILchDlRtFQ/AymmtSee3bVQFVBjXacfTGvZ8IrtxxANBecYM5Aw9sh0dcTnjp4gvHyiu81Q6K4sWHApJf8qDtwlBPrs4puw7UHgs+DIk4YWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738646446; c=relaxed/simple;
	bh=7kajYMDO5JDMRwqC8jePsiJ2UvjUsizoA4Z6/mVvci8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItkgIreBrZPVHV0hTxXW6Dho0FTcoZ4SWC2iwg5aSqzHAE876QBreBGK6rtGuyO97gu/ebP5CUuDoa+u2iwm58Bw6qq7TySLdWAaXioiJ6C3kPPslj7y88lIQXDuK+zOSvVIpeKyP5fXFkR8X3ei4eJetk+3eLyqfbFkNC899TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPk0frcR; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaec111762bso519485766b.2
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Feb 2025 21:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738646442; x=1739251242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aufxz7vW+i+gZ0u03eA6wj5cki34P7HhiVRExl0aNnQ=;
        b=NPk0frcRqTlXEw4qBVASBwl8TIH32/BrEarlDKrPHFmgLWhny0e4ChovAFThq+l9X1
         pH3ILelxEFZ48rE4rzR7fnMt3M7UIDCIwkeWcD+b8jVi2rAqTjW+qMk5uvkoKhKG4nA6
         PINnsZFZjkJ0SuWQNkazc+9WEaiy2tIGd0UUWv5Z6pH1TnvomDHDogwtZkcDHBFHj5ij
         t01OvFfs5PTm73g9oEpnITlFBg8K1rmevivHi59qhf38mJSFbPedM1M+G5PyYgqOQAqh
         pGTcXEivg4IED4/K1TNBoSCmudctjejETEI6BKDJl3hvR/cFnEdo5AYFsLJOXNfgMe61
         4yNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738646442; x=1739251242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aufxz7vW+i+gZ0u03eA6wj5cki34P7HhiVRExl0aNnQ=;
        b=BU8kqXwqwkeAoJszg2J8uv88HD0tGgfeQ+IsOlHGeu+MQr/Qda7W8zEXrtWp8ft9Vk
         WtOE95IhGN5GSOYH96dnuldmA7tQKJIanU/FWhs54z2IIUB+kMXj6k0dB8jOlV6wWeMP
         HyzuW8YMnISnxv95d2F0fkFnve48wnCbCSTDYEQQHVpIJSzgoyRUsazpbfVIZ7I3e4iQ
         aKUdezIXXlGI/OsD3RdjKpomYN/yqDOrJkBuP+92P1QH9ObUDAYTpRjr/1l36/aXzbwU
         gLO/RIdFrgzALCvF6KaqTCeG8ctikrWC1dXe2vy6TpmpdMwG6rgGYhGpzGZaAxor1zai
         cvPQ==
X-Gm-Message-State: AOJu0YyQV3NXupIGpmTAjLJIAyctSaDX2pN2wRIkfBuxQbJWUnNE5EPd
	He9HodchOM97rOfkkbJy06yyUUErx9RlyxPlRnVYWwbZzg9iB/Wcz7DeNQ==
X-Gm-Gg: ASbGnctMMyV0x78vWeo1mhCvnwKd8mtRQa4HtF5jD3nL7BWrdbbv8RZutM5dWP0MG1m
	0kB1N+BSqTVOngmUlhpXJwwf5I0iqoyPgmbXqtCm6UKP8wf+iW4t4Wav+OB+rO20IOgZUpel7KU
	FLbk6dAi3tKN187p4YYN0AdISge/6eiuG599A+epHwTKvKBRuQH2csJXnmhCtH9tCAdrdGq5Qsw
	sgLyKcX4fe96+D2xDcIn65zVfk01KWnPp3Zs7/yo5EjVOUObLi7mzGujVKVixq9346XbL495RbF
	rEFvqFGZ0/FI2rvOFkXygoUqcmgTfyu6StAMZiFsVb4hzZe9tv1SEvFqi4UMiNJLc5xYSyDrO6I
	Y
X-Google-Smtp-Source: AGHT+IG3DvrpMj429Djv6MZV5YUSQpWNOVDpJAZnQe8+Dk6hrrjR5L3ZqhR+qNvg17LUxiY+ZZEWEQ==
X-Received: by 2002:a17:907:a583:b0:aac:2297:377d with SMTP id a640c23a62f3a-ab6cfe17532mr2520035866b.52.1738646442213;
        Mon, 03 Feb 2025 21:20:42 -0800 (PST)
Received: from ozadorozhnyi-MS-7918.lan (176.111.178.190.kyiv.nat.volia.net. [176.111.178.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47cf883sm851545466b.49.2025.02.03.21.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 21:20:41 -0800 (PST)
From: Oleh Zadorozhnyi <lesorubshayan@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: Oleh Zadorozhnyi <lesorubshayan@gmail.com>
Subject: [PATCH 0/1] kbuild: fix misspelling in scripts/Makefile.lib
Date: Tue,  4 Feb 2025 07:17:29 +0200
Message-ID: <20250204052004.5583-1-lesorubshayan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <35574>
References: <35574>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

*** BLURB HERE ***

Oleh Zadorozhnyi (1):
  kbuild: fix misspelling in scripts/Makefile.lib

 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0


