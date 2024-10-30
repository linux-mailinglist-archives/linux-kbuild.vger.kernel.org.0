Return-Path: <linux-kbuild+bounces-4406-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD58E9B5D4F
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 09:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13E052845CA
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 08:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B46E1990B3;
	Wed, 30 Oct 2024 08:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwVAYNEL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDA921348;
	Wed, 30 Oct 2024 08:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730275408; cv=none; b=Byht4/+MoVBVstYMp6u7RMuUDTb4LxEp+Ty+tmTUUBPF+yEjdH4gAT8zwibsKa6i+C3gOSfg5dHCINZZ+dLyqwMP4vQ8CcdPHenuzmmCAmUDfWiEjgkKvPTuKChwNeAMf4WGFjaLtAqoS3lGVsfnuHQTzg1iK3dJzbcKjh4d2d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730275408; c=relaxed/simple;
	bh=Z05BLwZLTc6891MEsx1DxE+Uvc8sYJ/+30idLbMWN3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SD9OC/fusTSZkvuC5e9LX/ga+g6hS+LsvT5aO9ptiavjompf0Zsc80KU+SbvQhxZ75s/TSJogeMIu87J9rdfth9+Cfr7sMQIutQktv3fZjMFQCzWSgyB28/Jxu/n37L62zpvvaq3MowyABPCkGIfkEE+sX/2fQps0GD1RoXXT3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwVAYNEL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C361C4CEE5;
	Wed, 30 Oct 2024 08:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730275405;
	bh=Z05BLwZLTc6891MEsx1DxE+Uvc8sYJ/+30idLbMWN3U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bwVAYNELS8ZsxYT4Fngc0Yot78ySt6zACdN+yeAhfR7JVUNx3syIIHbgO3rELtmox
	 CoTF84Wf77vAhETQ6rSGzZ2ePkASDNrqYmg6jnuHrutcwGL21JVGvxVaTWsdA61LqO
	 HhShOXOHEPPBz+UO1EIbkLuMp09DkxQqbEyRH7vpzGG2vB/7awANHYDGOHrQSnsk78
	 Fr4g0Vat/zCeo/d/ZFF6ecojd8a4CF10pPzgnbXKkC7iiu22mlEweP+b76U2Z3Pjws
	 c5CUD9K5ecxMxgRKetXZBp9Jc4TG2BbkRhABjRdM6xRfTpQm/KCd5w0ETtgaItMkIl
	 TgT3GN169vmQA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so7886315e87.1;
        Wed, 30 Oct 2024 01:03:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlRD/tFJAI5ijROJPyeEiHb3R17k0QK2jyEXVfHMWjsJtOkB+QgBJ13tXpdIbmNF1dKyQFkSxaaDi+DowWDA==@vger.kernel.org, AJvYcCWLbwLUDQC19oVusmNSf4QHbSC72WPa3od91DHvfn2ywO4xDAPv2FYxAJQfbnqiBwbVE/r7r2grnbZ68sLA@vger.kernel.org, AJvYcCXcaUhKrQcp75PPraogp+qHtzezxvG2gZpc6wSuaeqTr+I70tXRMoRuOAs/HF267YcwHB5hMpslYiedT5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPRSKlfoLJJcm7IiH9uChXzidvkW54F/4vwpq83PTopp396jwH
	t+7xA3kVZhhxyO9Fr1eSqa2U7W0q0FXYKYgTObx+b8kEZcpBQdr1dZPqLtQERuadSGoEuM/8Kgk
	f5uAhqPgL5S5xSVxjvvnSfZvC9yU=
X-Google-Smtp-Source: AGHT+IGp9duhebvSBPuN7t1bGZWNCsbJrT3+g5gRR01jqZHhdfbmzJFgSTody/T7m5PXZY2PHYFFi3C2JyD6WYHNJsc=
X-Received: by 2002:a05:6512:39cd:b0:539:eb82:d453 with SMTP id
 2adb3069b0e04-53b7ed18622mr1135426e87.39.1730275404002; Wed, 30 Oct 2024
 01:03:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241029-remove-export-report-pl-v1-1-9cd6ccf93493@google.com>
In-Reply-To: <20241029-remove-export-report-pl-v1-1-9cd6ccf93493@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 30 Oct 2024 09:02:46 +0100
X-Gmail-Original-Message-ID: <CAK7LNATYQAfsvU+Gm8FqBkKV-EMgHWD8Fp_mVrR5Uq81Lv5nEw@mail.gmail.com>
Message-ID: <CAK7LNATYQAfsvU+Gm8FqBkKV-EMgHWD8Fp_mVrR5Uq81Lv5nEw@mail.gmail.com>
Subject: Re: [PATCH] scripts: Remove export_report.pl
To: Matthew Maurer <mmaurer@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 10:12=E2=80=AFPM Matthew Maurer <mmaurer@google.com=
> wrote:
>
> This script has been broken for 5 years with no user complaints.
>
> It first had its .mod.c parser broken in commit a3d0cb04f7df ("modpost:
> use __section in the output to *.mod.c"). Later, it had its object file
> enumeration broken in commit f65a486821cf ("kbuild: change module.order
> to list *.o instead of *.ko"). Both of these changes sat for years with
> no reports.
>
> Rather than reviving this script as we make further changes to `.mod.c`,
> this patch gets rid of it because it is clearly unused.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  scripts/export_report.pl | 186 -----------------------------------------=
------
>  1 file changed, 186 deletions(-)


The top-level Makefile should be cleaned up.

$ git grep export_report -- Makefile
Makefile:       @echo  '  export_report   - List the usages of all
exported symbols'
Makefile:PHONY +=3D includecheck versioncheck coccicheck export_report
Makefile:export_report:
Makefile:       $(PERL) $(srctree)/scripts/export_report.pl







--=20
Best Regards
Masahiro Yamada

