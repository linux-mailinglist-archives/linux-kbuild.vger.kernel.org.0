Return-Path: <linux-kbuild+bounces-10111-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B13BCC1187
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Dec 2025 07:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05D36309B358
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Dec 2025 06:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB0D2288D5;
	Tue, 16 Dec 2025 06:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liPk5Ehv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0631A28469F;
	Tue, 16 Dec 2025 06:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765866152; cv=none; b=GNDOE4iZ1pAvHGBArvpLKQotzzzQ9lWrD0f5ZXDDmnG3j+QVRQMPaf2KtPrC8Fp5Hnw7uo5mJT/mp0lrjMzEHPnE4KIJoUAor1YsLg6JwfEkvtH2WumGlcea6nttVBWYDnutfo3eNJD0Y1embdwevBw5+u5eVLs2ERsuMv4qVCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765866152; c=relaxed/simple;
	bh=vDI+wvSqae4aneiyCukRsEWLotiZNZR4r7HiMJLeEA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R10Q4P760JmStxEnJrouSQq402Ku8xUHe2usJivRbZyos1DPbTswjMTcCuvmfrhTVvl1RZdbXnGXMv75GRlki0xUON/AqEfLrdpKnVHfJiyY0ZBZodsqaSfb7kjrlS2uOY9qaHbCGIEh+Kx7xL3hfKFDTOd/85L5b83s3xxmN6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=liPk5Ehv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE804C4CEF1;
	Tue, 16 Dec 2025 06:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765866151;
	bh=vDI+wvSqae4aneiyCukRsEWLotiZNZR4r7HiMJLeEA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=liPk5EhvFB82oAtm3h9O2F7bv2CbhiJZPXJzxIt7etijTzGclXz4Slhy5epLhotla
	 WUeQUYGNKLhoPiw0Tvdn6B0NaIXVJqvVmW7m/C4UfueckpNj59mh0N4KQlOmjt0K5x
	 AtmwyEMb14tZkkOyb7GKQ9qO0Z4UNhbCHDHqfLMCOob9ogDQklA5iwAhvMPADLyxgC
	 iL2SgZqhyJMRsog1bBAViJOa7cymV6fiO8/MgSpQSXLRNEMovMJiV+IrM0JOPyI04r
	 i5OjOnPlV7mwJ73Y38/d1tCu3jOqWW3CZVxRVzGy8eq3ddvOn+/MsMhTdyrdWxwk1t
	 9GpcutsATjR/A==
Date: Tue, 16 Dec 2025 07:22:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: kbuild: Support single binding targets
Message-ID: <20251216-harrier-of-algebraic-diversity-83bb94@quoll>
References: <20251208224304.2907913-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251208224304.2907913-1-robh@kernel.org>

On Mon, Dec 08, 2025 at 04:43:03PM -0600, Rob Herring (Arm) wrote:
> Running the full 'make dt_binding_check' is slow. A shortcut is to set
> DT_SCHEMA_FILES env variable to a substring of DT schema files to test.
> It both limits which examples are validated and which schemas are used
> to validate the examples. This is a problem because errors from other
> schemas are missed. What makes validation slow is checking all examples,
> so we really just need a way to test a single example.
> 
> Add a %.yaml target to validate the schema and validate the example:
> 
> make example-schema.yaml
> 
> The behavior for 'make dt_binding_check DT_SCHEMA_FILES=example-schema'
> is unchanged. Really it should mirror dtbs_check and validate all the
> examples with a subset of schemas, but there are lots of users of
> expecting the existing behavior.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/Makefile         |  5 ++++-
>  .../devicetree/bindings/writing-schema.rst         | 12 ++++++++----
>  Makefile                                           | 14 ++++++++++----
>  3 files changed, 22 insertions(+), 9 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


