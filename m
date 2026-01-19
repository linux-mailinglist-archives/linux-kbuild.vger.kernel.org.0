Return-Path: <linux-kbuild+bounces-10675-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52104D3A417
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 11:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0416F30AED89
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 10:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C65356A15;
	Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tpxOnLrg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DA4247291;
	Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816840; cv=none; b=CRFEjZPIN7aKN/dVzq8Z0rEZjTmv55h4ypIWCJOUU7oNLnD/HZpwtImCRQNo0jvhLuWzk412ieWVeE5HVXg9ZJZRMkU3HLMHo1BS4ooVUd9p0//4b0iUpHGyk3QXvg02wORGvRP2TPEXfunuCj+yfHqZsS6jenVPj8oExKM8+/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816840; c=relaxed/simple;
	bh=zBU8QQHYrFrsHNhOOFAEymGNK0zcmy/ffgxlqEoVK/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyY4x5W3AEMLRbE6oVSWLsO9NO6rLP7fCo6VKuF1vTlM0ypj9aSuw8It/fKiqmOh/ssQWWETL6ey6j+X1znhLw/nqGat1ZRWYh/nF+Z9x3wMlsbXBdP1gTeFDm5XzTOXJM5FZJEeiAqMCAnOMS0u+pmDqKzFHf1rtQ6wP/12oQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tpxOnLrg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D81BC116C6;
	Mon, 19 Jan 2026 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768816840;
	bh=zBU8QQHYrFrsHNhOOFAEymGNK0zcmy/ffgxlqEoVK/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpxOnLrgpH84sLM7Z7/oZVp9q812KHBBZHcpxhJtH33vHqi6KeAcRDLNB+0JL/gbF
	 zYlHctIs4hSR1rtzHGJeuTAs2XkHkAH3RKAOZkww6Er1Ppxc9KPZsEzS+fUVcrk5jO
	 a87/egxPsHbzCIl64YDDP2Vh5S90StVdwwY7d/jU=
Date: Mon, 19 Jan 2026 11:00:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Luis Augenstein <luis.augenstein@tngtech.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	maximilian.huber@tngtech.com
Subject: Re: [PATCH 00/14] Add SPDX SBOM generation tool
Message-ID: <2026011938-varying-rinsing-63c6@gregkh>
References: <20260119064731.23879-1-luis.augenstein@tngtech.com>
 <2026011916-idealism-paternal-cfd5@gregkh>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026011916-idealism-paternal-cfd5@gregkh>

On Mon, Jan 19, 2026 at 10:51:29AM +0100, Greg KH wrote:
> On Mon, Jan 19, 2026 at 07:47:17AM +0100, Luis Augenstein wrote:
> > This patch series introduces a Python-based tool for generating SBOM
> > documents in the SPDX 3.0.1 format for kernel builds.
> > 
> > A Software Bill of Materials (SBOM) describes the individual components
> > of a software product. For the kernel, the goal is to describe the
> > distributable build outputs (typically the kernel image and modules),
> > the source files involved in producing these outputs, and the build
> > process that connects the source and output files.
> > 
> > To achieve this, the SBOM tool generates three SPDX documents:
> > 
> > - sbom-output.spdx.json
> >   Describes the final build outputs together with high-level
> >   build metadata.
> > 
> > - sbom-source.spdx.json
> >   Describes all source files involved in the build, including
> >   licensing information and additional file metadata.
> > 
> > - sbom-build.spdx.json
> >   Describes the entire build process, linking source files
> >   from the source SBOM to output files in the output SBOM.
> > 
> > The sbom tool is optional and runs only when CONFIG_SBOM is enabled. It
> > is invoked after the build, once all output artifacts have been
> > generated. Starting from the kernel image and modules as root nodes,
> > the tool reconstructs the dependency graph up to the original source
> > files. Build dependencies are primarily derived from the .cmd files
> > generated by Kbuild, which record the full command used to build
> > each output file.
> > 
> > Currently, the tool only supports x86 and arm64 architectures.
> > 
> > Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
> > Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
> > Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
> 
> This is great work, thank you so much for doing this!
> 
> Note, I just tested the series, on 6.19-rc6, and with CONFIG_SBOM
> enabled, I get this following "message" at the end of the build when it
> generates the sbom:
> 
> 	make[3]: Nothing to be done for 'sbom'.
> 
> Is that intentional?

Ah, it's on the second run that I see this:

End of the first run that builds the sbom files:
...
  OBJCOPY arch/x86/boot/vmlinux.bin
  AS      arch/x86/boot/header.o
  LD      arch/x86/boot/setup.elf
  OBJCOPY arch/x86/boot/setup.bin
  BUILD   arch/x86/boot/bzImage
Kernel: arch/x86/boot/bzImage is ready  (#526)
  DESCEND sbom
  GEN     sbom-build.spdx.json sbom-output.spdx.json
[INFO] Skipped creating a dedicated source SBOM because source files cannot be reliably classified when the source and object trees are identical. Added source files to the build SBOM instead.

Then I build again and get the following:

  DESCEND objtool
  CALL    scripts/checksyscalls.sh
  INSTALL libsubcmd_headers
Kernel: arch/x86/boot/bzImage is ready  (#526)
  DESCEND sbom
make[3]: Nothing to be done for 'sbom'.


That make message shouldn't probably show up, right?

Also, I don't know if this is even possible, or you care about it, but if you
have ANY sbom file present, it is not regenerated:

	$ rm sbom-build.spdx.json sbom-output.spdx.json
	$ touch sbom-build.spdx.json sbom-output.spdx.json
	$ make
	  DESCEND objtool
	  CALL    scripts/checksyscalls.sh
	  INSTALL libsubcmd_headers
	Kernel: arch/x86/boot/bzImage is ready  (#526)
	  DESCEND sbom
	make[3]: Nothing to be done for 'sbom'.

So, if I change the build config, which will change the sbom output, will the
sbom be regenerated?  Should it depend on the config .h files to know this?

thanks,

greg k-h

