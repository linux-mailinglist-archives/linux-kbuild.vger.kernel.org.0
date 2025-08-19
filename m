Return-Path: <linux-kbuild+bounces-8534-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9BAB2BA91
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Aug 2025 09:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CCDF3A9C0D
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Aug 2025 07:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C2730FF3F;
	Tue, 19 Aug 2025 07:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAF4eQTG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0212737E1;
	Tue, 19 Aug 2025 07:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755587904; cv=none; b=DOg+/MHzn4THHVk7vbc+9JOBi/Mudgvud26rgYsPtHR4Q0FWont0/gfiyRUbEwnUG2x1sFXl76kaNJ6K9959BFso9ikCC2kON4Naz05NsSDZE5gj1m1a/QV7yNwiMZfTTXQSBra/mmDsmztOlFDPGuh82bTvjDHxvp7JvOn6oo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755587904; c=relaxed/simple;
	bh=hcpxj2oWXllUB4ryEjpJ5p99A6U/Qzck//bdY10qOSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXiHpH6+wyPTnjsbH0B2HZH6ZLB0GQXP2sVh9t3Iet5s9l/H9LyE2GehvjYSqBnItSkxfsqjpJJZvvFOJXYMT6qH5bNXJEiGdHcYJSeimc9RZNB1Rging+f573H7rg02KOvRySP/+rnFNAAkMxwtUGlyi9N/P6vqfg8yFY9oYls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAF4eQTG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37AFC4CEF1;
	Tue, 19 Aug 2025 07:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755587903;
	bh=hcpxj2oWXllUB4ryEjpJ5p99A6U/Qzck//bdY10qOSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cAF4eQTGaLbVpBfcZ+ubR6STAZBSl958r+2HAZhwTabG9XPHP2LH8zYd4maWNEPld
	 JYNcs9o5sNAyV1wkg8r8OFoEY1Q+565/PL6xC1x5AAwD5YEZI83biOw6U8RK+A9Phj
	 B/V8jerDlz5LoSy4iQPyeQLnEo5zcFUjTiUGruXLpYw8SxlsX3FwuL7WRlGDu1KYH8
	 mXc3FIQT/rU/33ipowNy9uz0Fld+YDdlDBLmzKEQUbt6raA6VBURC+2M1sBQVvC2sF
	 CaQ9nOZdZ06tgiQMQRvlMVumMB2zfKxMIY1N1oL/lxFkYi5etRUH+BhotqJg2tPPrW
	 jyYQE5Zavvvdw==
Date: Tue, 19 Aug 2025 00:18:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Alexey Gladkov <legion@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Khalid Aziz <khalid@gonehiking.org>, linux-scsi@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Arnd Bergmann <arnd@arndb.de>, Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v6 4/9] scsi: Always define blogic_pci_tbl structure
Message-ID: <20250819071817.GA1540193@ax162>
References: <cover.1755170493.git.legion@kernel.org>
 <93ca6c988e2d8a294ae0941747a6e654e6e8e8b8.1755170493.git.legion@kernel.org>
 <yq1v7mkxe2h.fsf@ca-mkp.ca.oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq1v7mkxe2h.fsf@ca-mkp.ca.oracle.com>

Hi Martin,

On Mon, Aug 18, 2025 at 10:04:02PM -0400, Martin K. Petersen wrote:
> 
> Alexey,
> 
> > The blogic_pci_tbl structure is used by the MODULE_DEVICE_TABLE macro.
> > There is no longer a need to protect it with the MODULE condition,
> > since this no longer causes the compiler to warn about an unused
> > variable.
> >
> > To avoid warnings when -Wunused-const-variable option is used, mark it
> > as __maybe_unused for such configuration.
> 
> Applied to 6.18/scsi-staging, thanks!

I think I will need this change to apply patch 7 [1] to kbuild-next
without any issues [2]. If there is little risk of conflict, could I
take it with your Ack? Another option would be getting it into 6.17 as a
fix so that I could back merge Linus's tree and apply the series on top.
I am already going to have to do that for the pinctrl change that Linus
W took [3].

[1]: https://lore.kernel.org/22b36a5807d943a84431298c18b41d093e01c371.1755170493.git.legion@kernel.org/
[2]: https://lore.kernel.org/aDWoCU2YrxaCBi42@example.org/
[3]: https://lore.kernel.org/CACRpkdZ9oyJ4aJ5Dcp_Dtv5qoiSo+g5cO7Uf4PmHgv_Z423onQ@mail.gmail.com/

Cheers,
Nathan

