Return-Path: <linux-kbuild+bounces-8953-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D63AFB9AE00
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 18:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC26A7B1880
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 16:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E86313287;
	Wed, 24 Sep 2025 16:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9b/0eOD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0278C230D35;
	Wed, 24 Sep 2025 16:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758731126; cv=none; b=b0U9/a3obgVih2qASbbiciHLKr/1oRBhXN5NPXKFZPyD3pdf1oxRBTSZFcYmC3BAmju2su43BzdMFOWz/5fPc5pPvOMO/ZErS7YgRXXB5RFFaYdr25MjpS03UbValvi3LkwaH2GskP9OfNDdtiDdG++imBE2OVYfWg5Yzpn+FH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758731126; c=relaxed/simple;
	bh=fgpXWT75ZxeTBuFCW1gI/2m0CSg/b3re3eUKkgx1ud4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kG0LaflEa1X3wKPAUMKV2rtRjEBCdSizNpc8uBE7S71J0BzKgYbXmp3dYRrf3gxpKPTw/LoOXDDPYGujbhyu7DBvL9p+SJeWxP6c42ZU0F5igKy65EqsYOoIh9uu/i7ZF594x9oCf4A3yqfPsjB/n4vgbgcChN9lh9/oSlN5/fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9b/0eOD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D26C4CEF0;
	Wed, 24 Sep 2025 16:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758731125;
	bh=fgpXWT75ZxeTBuFCW1gI/2m0CSg/b3re3eUKkgx1ud4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p9b/0eODI+0WiHkzdGKZpTPfe9jKNRfE1aDozQegoNWcsnAjYRLESrDU0dFHVLYRX
	 wst6KBI3EiPsSa6+URpsXzkix7xah3HyncBIb9FU5M2eZMRGx34ayYO0cTeTEN5NEl
	 Od/uH6K8LFTNFI0KeKeCOhHN/enttFrm65mpFaK7iLRlMmmAF/jX37kOxtBaO0pFDB
	 EbxRv/8ZtqsemrNMovBaJGVsa/8ZhUVYwkYLKrJlxZc3akIa/FlWmK1hjKEdfdMbtp
	 rCeWYIxPo5ytf28pcaFy/n5VfHKjfGIp5MXRdvVRgt9vLnTN8amf2TbsTVmVvrjCvI
	 gUw7ocemPX/Ew==
Date: Wed, 24 Sep 2025 09:25:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Puranjay Mohan <puranjay@kernel.org>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 1/3] kconfig: Fix BrokenPipeError warnings in selftests
Message-ID: <20250924162518.GA2827867@ax162>
References: <20250923213120.make.332-kees@kernel.org>
 <20250923213422.1105654-1-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923213422.1105654-1-kees@kernel.org>

On Tue, Sep 23, 2025 at 02:34:17PM -0700, Kees Cook wrote:
> The kconfig test harness ("make testconfig") was generating BrokenPipeError
> warnings when running interactive tests like oldaskconfig and oldconfig:
> 
>   /usr/lib/python3/dist-packages/_pytest/unraisableexception.py:85: PytestUnraisableExceptionWarning: Exception ignored in: <_io.BufferedWriter name=12>
> 
>   Traceback (most recent call last):
>     File "/srv/code/scripts/kconfig/tests/conftest.py", line 127, in oldaskconfig
>       return self._run_conf('--oldaskconfig', dot_config=dot_config,
>              ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                             interactive=True, in_keys=in_keys)
>                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   BrokenPipeError: [Errno 32] Broken pipe
> 
> The issue occurred when the test framework attempted to write to stdin
> after the conf subprocess had already exited.
> 
> Wrap stdin write operations in try/except to catch BrokenPipeError and
> stop sending more input. Add explicit flush() after writes so we can see
> delivery errors immediately. Ignore BrokenPipeError when closing stdin.
> Explicitly call wait() to validate subprocess termination.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/kconfig/tests/conftest.py | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
> index 2a2a7e2da060..d94b79e012c0 100644
> --- a/scripts/kconfig/tests/conftest.py
> +++ b/scripts/kconfig/tests/conftest.py
> @@ -81,7 +81,22 @@ class Conf:
>                  # For interactive modes such as oldaskconfig, oldconfig,
>                  # send 'Enter' key until the program finishes.
>                  if interactive:
> -                    ps.stdin.write(b'\n')
> +                    try:
> +                        ps.stdin.write(b'\n')
> +                        ps.stdin.flush()
> +                    except (BrokenPipeError, OSError):
> +                        # Process has exited, stop sending input
> +                        break
> +
> +            # Close stdin gracefully
> +            try:
> +                ps.stdin.close()
> +            except (BrokenPipeError, OSError):
> +                # Ignore broken pipe on close
> +                pass
> +
> +            # Wait for process to complete
> +            ps.wait()
>  
>              self.retcode = ps.returncode
>              self.stdout = ps.stdout.read().decode()
> -- 
> 2.34.1
> 

