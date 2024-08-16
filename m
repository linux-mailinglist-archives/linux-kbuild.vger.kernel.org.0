Return-Path: <linux-kbuild+bounces-3040-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1529546AA
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 12:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B85B288FC7
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 10:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330651509B3;
	Fri, 16 Aug 2024 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Srk8N6Ko"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC09157A41;
	Fri, 16 Aug 2024 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723803647; cv=none; b=uKiVBys35vB5pN89ghEoOLArL9SgZDoAi2EK52AGVcG4RpLijFAJCaDpz9b3aIylx6CMHvvf37GvirMA6sfMGyA7/GqimhXHTcrCHciRFYD2w1cUaPEr141kFMvH0NzqurPPWOrQJDxPynkXlySLX2M6czSXI4urLxaagDlBJF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723803647; c=relaxed/simple;
	bh=2nUpSfXQ8VjKDxrrXyZDwfnvJXY5+u+Z/Er3OY388J0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PgtQAyB6ZFaf9FJIAycS3un8KRvoSR46DgwmGD4kaId4TOy2AdrKDyTbx6IHQSA1Zetgu7xdAyDDsLcy5vh2nRMylRcPIL1H+EX/Uq0M2TItLyA7rtJU/WHh+XRLDlGrVECTL0zPp4/5ZTI1zARkynuZtnsQotxrjHTxus9X7ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Srk8N6Ko; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-368440b073bso975000f8f.0;
        Fri, 16 Aug 2024 03:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723803643; x=1724408443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAqdFjLwBWAGL5CpBuQGCDM0Jz5SC8n64NSZVNoxjcI=;
        b=Srk8N6KoHhMUaUtWY9y/4FY74OEeiCpCE9ZuVVZzZ5L1OurMPxYq8M5vIMbZjNlIJS
         HNum2K8mDpuYyEFL620qKId3LEulwqnLQ5m7MQ2m4QshKZSH+yfW7LDdnpyNTSO8F8/N
         DAyyuAbmjwBBBj7SOEUL6sxAW3sdf9KQrmFcdPTRBZHCvGJIvEpnv/Q4TYu8S8+YZDlG
         VdVxNccBayjEsQGUMwZRMTXGPTeWMvP2WHcpUaBtTcqSEHGKozHNOFFGlWktR+qBI44d
         Fk6z+YNitbEe/pEcF0kUZA6cp6c8V6poL+1qSfUhsUyZmDDJi8XjFDvXSGQkd+sqBuZM
         Ebgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723803643; x=1724408443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAqdFjLwBWAGL5CpBuQGCDM0Jz5SC8n64NSZVNoxjcI=;
        b=jUf3lxp5E+hV6sh6zuSOnp6MigJv0E52xBhEiEVkc6FnCNRO9ZKk8xRJkv2LhZZ9gd
         Iq+3Hx5lkt8WtEoKucYEU5OGsDF2l8pwTbF8qLK9WFU9zpwWuAJBdHO15s1LQIWDIKVr
         eCjDDqqzSaZ1I9N1BKW6Xj93ikQxW1dplARTp0TKORjQiWMs+vUjVLFAm/NCbK8ud/NE
         d623fzSEaBZfMHEhhQsw7rb9UlYmVtGcx8sEmNsZT8s6cffCx8U9i1u3wKG0o2z+4Kbt
         PolaJzA+64IucBQKFuKeKZdtAUV0s76+rz+Z29V2ANd82g9if0PbayhlFKcwycOQzyRi
         5n6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmSNNGIgqGhSZyyHRFZs42KqrEC+b5E78Evn57RmZA4+gQPIaFRDRAh26qq8mke/tVWN0nrWyk2vAQjvH2cNpf5LW1aVssxWfXfcSM/fKPqRw7OBmJrcK6z1eG7wjUEQ6Oi5qYvccn470Y
X-Gm-Message-State: AOJu0Yw7PN4ciKF8mfJbPigfCk3r+01SLgxhfhltYX8ch2JbKO4Y1kdO
	9tTy3Q8UZxjgTXKYbDOye3U/OLMz3XOXt5vZket4VGKpkEXBPRXN
X-Google-Smtp-Source: AGHT+IHJ5PIwLZxVELLggb0fZ0XcGYWz+omxCFvjcrNyQE7L9vTRxxh8Wu4w3minGDTpekSs2gfQyQ==
X-Received: by 2002:a5d:47c4:0:b0:371:8327:fdc9 with SMTP id ffacd0b85a97d-37194bb0035mr1728215f8f.11.1723803643180;
        Fri, 16 Aug 2024 03:20:43 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20::c7d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718983a3a3sm3331332f8f.12.2024.08.16.03.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 03:20:42 -0700 (PDT)
From: Ole Schuerks <ole0811sch@gmail.com>
To: masahiroy@kernel.org
Cc: deltaone@debian.org,
	jan.sollmann@rub.de,
	jude.gyimah@rub.de,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mcgrof@kernel.org,
	ole0811sch@gmail.com,
	thorsten.berger@rub.de
Subject: Re: [PATCH v4 02/12] kconfig: Add picosat.c (1/3)
Date: Fri, 16 Aug 2024 12:20:01 +0200
Message-Id: <20240816102001.21668-1-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CAK7LNAQ9fddijdAJFNYKqA3nQibwiv5jvZs3O9-nDbcRToWS4g@mail.gmail.com>
References: <CAK7LNAQ9fddijdAJFNYKqA3nQibwiv5jvZs3O9-nDbcRToWS4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 8/12/24 10:41, Masahiro Yamada wrote:
> On Wed, Jul 10, 2024 at 3:54 PM Ole Schuerks <ole0811sch@gmail.com> wrote:
>>
>> PicoSAT is the SAT solver used in this project. picosat.c is the actual
>> SAT solver. Since the file is too big for a single patch, it needs to be
>> split up. This patch contains the first part of the file.
>>
>> Signed-off-by: Patrick Franz <deltaone@debian.org>
>> Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
>> Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
>> Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
>> ---
>>  scripts/kconfig/picosat.c | 3000 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 3000 insertions(+)
>>  create mode 100644 scripts/kconfig/picosat.c
>
>
> I usually tend to avoid adding huge files like this.
>
>
> Is this for avoiding any portability issues across distributions?
>
>
>
> Debian:
> https://packages.debian.org/search?keywords=picosat
>
>
> Fedora:
> https://packages.fedoraproject.org/pkgs/picosat/picosat/
>

Thank you for the feedback. If we didn't respond to any feedback
take that as that an acknowledgement and that we'll implement the changes 
in v5.

I think that with these packages (and if we additionally provide a 
repository with a script to compile and install PicoSAT as a library for 
the other distros) this should be portable enough. We will remove the 
PicoSAT files in v5.

I assume that it should still be possible to use xconfig without PicoSAT 
though. What's the best way of letting the user know that they need to 
install PicoSAT if they want to use the conflict resolver? My idea would 
be to notify the user via the GUI when they try to use the interface of 
the conflict resolver without having PicoSAT installed. Do you see any 
issues with that/do you prefer some alternative approach?

