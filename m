Return-Path: <linux-kbuild+bounces-6071-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA5FA5CFDE
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 20:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BBF01898BDA
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 19:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F79264618;
	Tue, 11 Mar 2025 19:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O91cDcVH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABC7262819
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 19:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741722505; cv=none; b=c1tfYcPDlf2Q50oxe5s290e1JfFxNEALWGRJnLYZbxTEhIZTWL4IEDzligWpO4hVA7uvv04TtYezqFKmcxVWq/kYVIhzq9h0Ij0atwtuDzCjFpdP1Npn+UK3Tko9PlKu14W3YixtlSjUYkEch5JToe0fXRr4z4DZP2kSeKTlWrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741722505; c=relaxed/simple;
	bh=vhNVQdNDYSih4Lx175Wa2Gyco9Sdx02kK0YISuEpTH4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=NJnbJl74i7Cbl50I5MN+rdEBWsDt8amVj3LtS2X3mVGwCktzicoLn7n0ujcMnkfCzQW3n+2yD218pq4L4ttAjet+Slf13GfuEvXcT5cfzb4PoZ8frsKBNYTtObtqVeEPFm5OE/3Sb8quGY7Q8Nqcb+SZxkKql8M7rTx/fuDIc+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O91cDcVH; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e60aef2711fso4186924276.2
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 12:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741722503; x=1742327303; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vhNVQdNDYSih4Lx175Wa2Gyco9Sdx02kK0YISuEpTH4=;
        b=O91cDcVHL2E4TgVjDjw7f+r6Z7vVVAkjDTagGPDOWoAdht8DGj6y+gFD0Tt/Tp6hJ+
         RtidXTBp4FVTYyABVBw9hgxxer5vZjrs9J8jdLokMIAkf5l+iHPlRffk+plzuW7FRAU1
         V8ZOcgNUxyhvNHq9nN+yNCDB1ppeHwWA7Catvh3EXHtUlGhcR/s5A+hP/4ZIksFo8dO+
         SX1rExPiBKWzLZ8FT3v99qtvrU+s1X3IgnWEucvf+o+w0AQHgOkuvW26y1pGcbiqpfLy
         JC4od7sqhjwT3B2ZvZ8jT3XOJ1hxDW1Fz3GEg6RwTydfXoBp+wg+gipH1L1xKeGxhziZ
         CJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741722503; x=1742327303;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhNVQdNDYSih4Lx175Wa2Gyco9Sdx02kK0YISuEpTH4=;
        b=aWUopydvTCmoNJs3hyyOup7xj4ob0AVL78B5/qkrQT+Aql0YVb6zQ71wQ+doDKx4+5
         dskS3mjjJ3DoO6Ksp/GuNYSmoxyHGPkvzL+MXQ8NXzdR2khtTnkjg/mhnjOx60AYrW3E
         G+efcSjddL8nfcLk4NTLIoUg72dS07LAz9C8ggbU9IT8QDXffoIdY9xYsKfLjqEY5tQe
         Dv8eevV3gFCYTjvD6qR9iB8GmD7sx4syUoHJyIgED0/4sKUdvfmrma+fscET9qrTaEGV
         inKTeWwRhxcZudPNhmea8OC1X4EGC8pBEhvySWxy3TzikUyIUdfYzHHcYmLTrycHdx9E
         g8EQ==
X-Gm-Message-State: AOJu0YxGefQFTeKjqeT1pSa1XTwkjsak9NKASE0O5htrZl2VhHwFYsqV
	Rxni5SyBKsJbtwvQMa4CLYsnOqNt5QqPIf4rNoZEfdl1Dqq3XMdm0ZS+S2UNlVLZc1ShAavLob0
	C7N4o+HjJARRFS3Z3UeuQTaO7YUjjT1SY
X-Gm-Gg: ASbGncvXMK6dWk3hWE+KwWgZFIESAgGkJxJozmkYKNwKYPR6JE0sO8U6Ae/woc17e6c
	QrFrUg7YsrNB/Bxr0z2oMpSu7TLtIl41Yt1c7TU/4QFogANXMpGCv7lAjj0O45ZoiXTwx4UPaTs
	kNPGbdfFhZdM1UkD62As9lAv+C
X-Google-Smtp-Source: AGHT+IGPMMufT1oqFSzbGd9dGSr+f41SVFV2WSdHWV08iAFiJpJVcV4yoopBbVmYVcrURubPdd4faAHc60btkVuvrm8=
X-Received: by 2002:a05:6902:726:b0:e5a:e39d:c2ad with SMTP id
 3f1490d57ef6-e635bf0c295mr25429883276.0.1741722503194; Tue, 11 Mar 2025
 12:48:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Maverickk 78 <maverickk1778@gmail.com>
Date: Wed, 12 Mar 2025 01:18:12 +0530
X-Gm-Features: AQ5f1Jpf2-OCXZ1X9tXy05-WJ7HW_ifqbLgflb_TinlfU5GX8pbhsXAhK7qg10o
Message-ID: <CALfBBTv0S6HjsC007cFPCBawvm=awuUqm85TT9L_h+ud8xok2g@mail.gmail.com>
Subject: MODULE_LICENSE Build Error
To: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

 Hello,

Hitting the module build error on latest Ubuntu

 The build works well with pre installed kernel and the associated headers

But after building fresh kernel, trying to build the module again, its
hitting this error.

The MODULE_LICENSE and other declaration is all there but still
hitting this build error



MODPOST Module.symvers

ERROR: modpost: missing MODULE_LICENSE() in nt2.o

ERROR: modpost: "__modver_version_show" [nt2.ko] undefined!

ERROR: modpost: "__SCK__might_resched" [nt2.ko] undefined!

make[4]: *** [/opt/kernels/linux-kernel/scripts/Makefile.modpost:147:
Module.symvers] Error 1

make[3]: *** [/opt/kernels/linux-kernel/Makefile:1939: modpost] Error 2

make[2]: *** [/opt/kernels/linux-kernel/Makefile:251: __sub-make] Error 2

make[2]: Leaving directory '/root/NT2_AppLibDrv/nt2drv/Source/lindrv'

make[1]: *** [Makefile:251: __sub-make] Error 2

make[1]: Leaving directory '/opt/kernels/linux-kernel'

