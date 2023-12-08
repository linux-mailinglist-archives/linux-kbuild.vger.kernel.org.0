Return-Path: <linux-kbuild+bounces-299-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A88580A456
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Dec 2023 14:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC78E1C203DC
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Dec 2023 13:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4301CA83;
	Fri,  8 Dec 2023 13:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="eCbJM65F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE8691716
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Dec 2023 05:21:11 -0800 (PST)
Received: from leknes.fjasle.eu ([46.142.121.132]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MDhth-1r36rE2vLz-00ApQE; Fri, 08 Dec 2023 14:20:51 +0100
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
	id 1E47A3E78A; Fri,  8 Dec 2023 14:20:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1702041641; bh=QDL5JcqlyVOnFIyl+IQV8GsQ4nRlAMjLx+obmLW8jTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eCbJM65FZFkCfv6CHsYJNVM4KDXDSop7vJNSjw6UjR7M6KrQJ0M/73HlPC0kTl9Pb
	 g0+QRbL3RajyHgWiF/4KZbeD6bZER9TWL8eQI4egrxCD0yQejtsj3+avIv89au+cDn
	 TY3a7Hgu0tCOLu072tP4QuH5+loOWKrudPT+iZTg=
Date: Fri, 8 Dec 2023 14:20:39 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, morbo@google.com,
	justinstitt@google.com, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] MAINTAINERS: Add scripts/clang-tools to Kbuild section
Message-ID: <ZXMYJ6JCm3ZmDJ9G@fjasle.eu>
References: <20231205-maintainers-kbuild-clang-tools-v1-1-a646a1985300@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205-maintainers-kbuild-clang-tools-v1-1-a646a1985300@kernel.org>
X-Provags-ID: V03:K1:iYfwVXTmwwrYz1qs3mVONKhDPEE1wQY7wYRTotUVhsZaDlv7/+f
 iPJhP7egDSBrXu/RZsJYEWNt3G3aAEJVTWkONFs5juLZPZ6VVUBd4jBSoJQwyVn7ZMv8OxI
 uEx+mlafCrUR/d93pgxyX7ginLOlHlDeg/U3WbK/qBS1l3hvC1vZI0XAwv0iaIBH6txcA91
 g5ogTfQn7ipaaik0hxjhg==
UI-OutboundReport: notjunk:1;M01:P0:0TBQjhC65wM=;yUcGJeEGF1YkV1N1hDUTiPqZcS1
 NCmo+aR/8WGb3NcgH836Cr2Q35jc0R6M/II7ph9ZG1swDtr1736a063hMzPYbP/2Azh9ZFGr6
 76ym+6lMz3QqVPP+EHUX9TK6eZs5mqUB7QwLw3Y0BnEXrDboPGwJfi4U7o4MvhHb6Gs0MXAKU
 e0jXkuWJ0744Tvps2/Zyazw0uoB9iGXufXqvUzjILPLa+TzZDo3HlIN3VQhVgH9vsv3zXOzBT
 uAgQA+pDvjnBs9ojMvRg9tTjO7FwrkNmZyYc9k9tC3ZXCsBB+sGjzlip8gaIacc08AS0855lk
 jYWWtnVvu8JoOo73bklyMoiZgjkNfq1jpnuN4cu7KHY6iT2Yl3lQV0BI7yBCob9hGlO5HymS2
 PH6phY922SJvKF62sOIO9BoNOIk86QZ5d1dKIA1qBOL+P6J2ykfUh7GL3gqMkL828O45OADwM
 FdGLn7nPOoYiRgzOFt4l7EukIMX9Vxg+Bs3/x0u0knLC+0VzNNXixmTlcchMjvk/FKoor+jKS
 kNWxhfeGIp0jei/7WbVKSIReHF/JVYGMNpOWfqm84s2g4Y/qJfJR9wgn5Q9TzpHaLfuwDnyLo
 GOPrlQQ1SVAz5IK70PzKO5qYXrIPfLHtuYfK2C3k+4i9fs8JBXctOVDDApQMmlwTuy7tq/d0Q
 T4qwW/svGb1eeu87KjWsWsJ49+nk4L0Gsiah+wIPpjBO0CsYuZMC8zJU0a1Ou8KtDTNqO/Rnj
 i4t6W465Kv1TYA1Edk8nhFSXsEb4sNQYc4tChj6KZbuN5YF1pNg+cxSG4BiFh09vgTIypKvLu
 H34kiTreGLxAzGpkA4aAfM1x7LpB+xzdN0FeBowWL2AiwPsVbyCIFGTYJsOvk3UwDfxePfgwp
 hjXAvdThKzM7rpw==

On Tue, Dec 05, 2023 at 10:05:57AM -0700 Nathan Chancellor wrote:
> Masahiro has always applied scripts/clang-tools patches but it is not
> included in the Kbuild section, so neither he nor linux-kbuild get cc'd
> on patches that touch those files.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 788be9ab5b73..cd9bf44dc1b3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11526,6 +11526,7 @@ F:	scripts/*vmlinux*
>  F:	scripts/Kbuild*
>  F:	scripts/Makefile*
>  F:	scripts/basic/
> +F:	scripts/clang-tools/
>  F:	scripts/dummy-tools/
>  F:	scripts/mk*
>  F:	scripts/mod/
> 
> ---
> base-commit: 33cc938e65a98f1d29d0a18403dbbee050dcad9a
> change-id: 20231205-maintainers-kbuild-clang-tools-93666b423b02
> 
> Best regards,
> -- 
> Nathan Chancellor <nathan@kernel.org>

Thanks, sounds reasonable to me.

Acked-by: Nicolas Schier <nicolas@fjasle.eu>

