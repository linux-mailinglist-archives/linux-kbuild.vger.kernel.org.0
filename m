Return-Path: <linux-kbuild+bounces-7336-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA2AACAA1D
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 09:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B5FC3A8975
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 07:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42D41B392B;
	Mon,  2 Jun 2025 07:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gj+9cT8G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6813F4F1;
	Mon,  2 Jun 2025 07:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748850794; cv=none; b=Uoefkxdhlo1c/jO6SQl9IgktfkCHzwS9w9BfVIFPfozmMZ0iyi3gCWkRkuAWJnmkpXbvpBxHJ+N9At7PCxRGYS1I2NRFBp5QIu+6C7fh7L1ASznVd8T0SBOQ+/L28w8wLBcjxHXLS8E1kf3KLfAPpSk8tW5OadqMyuAhhNwJRvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748850794; c=relaxed/simple;
	bh=/rJBYGBscvluJvJ9wRw39FEpgeLiRZYfywd1G8dpbXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NpJ0OECKPvm3U0GnyMRzMr+AZz4IT45r7csc8BmDjqh8toqlJbz4qanNK1ybhvCvkQBeP+Mlk2YKxwoHlH7G0otxC28z6+WeOgzpXsr5X5YGSmhMIjJqOb8rtODuGdosMWScq7Rr+OR89CKVzi2KwhSynlXyOys+6SWb6oMBsO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gj+9cT8G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171F1C4CEF3;
	Mon,  2 Jun 2025 07:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748850794;
	bh=/rJBYGBscvluJvJ9wRw39FEpgeLiRZYfywd1G8dpbXU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gj+9cT8GYb0SjjrEuboE+A78RfRblG1M+OzkjpTvaas4oTu1rjpBK9gTpRHZHvQh8
	 yLfKNJUDtZNiX66KGqLo5Yv0Pg7sbJCyVW1T2lps7eXJ+/5ZwD09NlAghY+fr52naU
	 yVTcm3uAJYvaLCQjOzk+x14djv/Lf8BN23keQEJCUemRCy6IQEeXvlWrexZ7Ug4AkC
	 H5BxCz94fuSePFTPRo4dReXN3R+PewnOC3UPJILJ5DWLnEWRcgc7d0zGUjQQyDK1+F
	 20DbXsymhhF//rMPK5R7Cmwe4PN0Bqnjq+GFqLzydOnz6Sn3NvwXeaeTHFq1PQ5sOF
	 t5ZTkfnhTnEcQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553245cad29so4292830e87.1;
        Mon, 02 Jun 2025 00:53:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrlw6mJdBDcF5jeXoGQ4vfI5m3YuibJbFXf9oxKCNbm3zwQYc3oJvVEgnTagMfla1+ZE940exyXtGw+nY=@vger.kernel.org, AJvYcCWfckKudZOZbjHiQmxOwzNSMtmXr+nrZSYZm2SIZj66KmhNwA99x36gkQze9aSSJbWuVfzLAK8kdcDaBgl//w==@vger.kernel.org, AJvYcCXpROGIqpzL/Ho0DRlmZ26lzfxNpCd2dqXA2umk7WefGixts873xaOPCjXrPoR68XBMXYzikO+4rQapU0+S@vger.kernel.org
X-Gm-Message-State: AOJu0YwmY7yHMINB85jiATCSkeDQeecpJbbgUDPy3do9zzKt3o+vQ+mQ
	IZZnD6wbGxUf2Pzh8NID12fVLkPPmn99h7HxfBK8k2hGfT43nL/Gh+9CP3UNltTOQEXH6scECWz
	j8cilZx7UGx2bOqyOR5V1XLX7zvLnoqw=
X-Google-Smtp-Source: AGHT+IHrzP5vCzNBO8rsuuZc4MUBn4InHXHGM1Mh7yraHQYlpwpZQVqX7n/e+bDSzixs4WpA9pChtdNeV8Vm7GHzUZA=
X-Received: by 2002:a05:6512:138b:b0:553:2bf2:e303 with SMTP id
 2adb3069b0e04-5533d1ad7f8mr3217556e87.30.1748850792779; Mon, 02 Jun 2025
 00:53:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1748335606.git.legion@kernel.org> <ecf0ebdda5bcf82464ed1cebbf50afdcd8b5b23a.1748335606.git.legion@kernel.org>
In-Reply-To: <ecf0ebdda5bcf82464ed1cebbf50afdcd8b5b23a.1748335606.git.legion@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 2 Jun 2025 16:52:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNARm1+L0CrE8TYrFaipfOX4pjEJ7Uz7dn=3g+26PER6jNg@mail.gmail.com>
X-Gm-Features: AX0GCFtkjb31-WAYHWscWDXqBhwu5LeuN-xEm1GdcdTfFK0q6AEDTTpEFsEdaEc
Message-ID: <CAK7LNARm1+L0CrE8TYrFaipfOX4pjEJ7Uz7dn=3g+26PER6jNg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] modpost: Make mod_device_table aliases more unique
To: Alexey Gladkov <legion@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 6:08=E2=80=AFPM Alexey Gladkov <legion@kernel.org> =
wrote:
>
> In order to avoid symbol conflicts if they appear in the same binary, a
> more unique alias identifier can be generated.
>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
>  include/linux/module.h   | 14 ++++++++++++--
>  scripts/mod/file2alias.c | 18 ++++++++++++++----
>  2 files changed, 26 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 88048561360f..e7506684069d 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -249,10 +249,20 @@ struct module_kobject *lookup_or_create_module_kobj=
ect(const char *name);
>  /* What your module does. */
>  #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _descr=
iption)
>
> +/* Format: __mod_device_table__<counter>__kmod_<modname>__<type>__<name>=
 */

This format relies on module-name mangling, but
I hope we will be able to stop doing it some day.

Can we come up with a different idea
in case <modname> contains hyphens?








--
Best Regards
Masahiro Yamada

