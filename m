Return-Path: <linux-kbuild+bounces-11574-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELQIGn5RqWkj4wAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11574-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 10:48:46 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 049E620EE8F
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 10:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC4CA301C881
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 09:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2281D31E823;
	Thu,  5 Mar 2026 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1Pqemu9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F171A245031;
	Thu,  5 Mar 2026 09:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772703734; cv=none; b=ZYWy22AhUterUUWTUm6xuYXfND435zVSEoK4a5yPF/woinztrCT/zMWhevW2ZPuOm5nXSWWkf3/BPVp3/ntGzQVAEykaAhspfme4wS32MDkcVpklR3KrRpBxdejEPvj1s52wPJaeasrlUh5ZV/Lj8/nnLhfFQ6ck0gHK2YGxySI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772703734; c=relaxed/simple;
	bh=Wx2LogNDbns541SnFVUv93/3oIAkkkOiWLeIhqW3jiU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=u8iEdz0lhO4rK8VRIPCg6Xcm6QE9KucWOfZHX5+8AG50Q8R7RnIjvKXkvD29X6h80o0YkLIuq2CfEIxCa+BwhfueCcERxw85cTiSltGTln8dgF7S24VXouYbnmTw7N0nYKiqXBDltrCn8AHrQnsOK1TuQUeQHIA5tKkM96JQZpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1Pqemu9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D42BC116C6;
	Thu,  5 Mar 2026 09:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772703733;
	bh=Wx2LogNDbns541SnFVUv93/3oIAkkkOiWLeIhqW3jiU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=A1Pqemu99Yfpw0QnYo8TB9yTHrR0fE2RDK9jTlVIN0EEeJ9kc/ThHQn3qrOSiVBD+
	 8Dc7i2cY6yhupxUVvXmieUq1RNLqhjsB/T6lQu4x3vdMI6JSaJy/QeMZDZ320FAwfc
	 tAa/hp/eLwBhINTBnXlcxHwqYaXcg0SIABHB5eARBlkdyTwNXfp9kcD1DFeKNUYg/J
	 NJ8zpo86WEGlojPjbKfetcWgHiLXKLdJ49qGrboKbmI520xUAr7K5hJelqpA3vSuAN
	 X/iDHVM4SEC552AwE/52wD9y1oTOb0sBdJQ/B/mthKQjTnx1/yzgVqRyZ7aGRpVk1+
	 TyTSwmQIAXrwA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/9] kbuild: uapi: remove usage of toolchain headers
From: Nicolas Schier <nsc@kernel.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Brian Cain <bcain@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 linux-hexagon@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
In-Reply-To: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
References: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
Date: Thu, 05 Mar 2026 10:41:55 +0100
Message-Id: <177270371590.103031.6257749379376584635@derry.ads.avm.de>
X-Mailer: b4 0.15-dev-363b9
X-Developer-Signature: v=1; a=openpgp-sha256; l=444; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=Wx2LogNDbns541SnFVUv93/3oIAkkkOiWLeIhqW3jiU=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBpqU/qjDPfC5xvFortkyG0MKGDxmPaelRTIOk1e
 ot9NlLEPwWJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCaalP6gAKCRAHUgpwFiYS
 aY3mEACXuJeGoqWpxF9yVei8JmJpgRj9WMvVu4Hw0bLHKIdgUwr0DJRshynekgezYGyd+EFFalL
 VyHmc+utk5ykVt6Sewnt7Eguf6fe6HbR/A9ZlfAQnSVvIQp2s7L8NamyO4Fu9jLc0FeFg+Fp+FQ
 tASyB9h1c1syQ6Hg6fqbKUETQztomVhjNfsXmP7ALSSgzJB6UIUwc3Jf9kYgmKtBJDgMey3mETe
 e6b6Fc4fk9Yk2lpwVyo7Nh39f7ZPJwnjg++x7hYzhbElJvASjPIqyrtKUC9OCmhjwzOM4FkRdgg
 xPGZomBnFPkbe/PjYM8Ly3TevVO4xvWNdYYEASlq+LXKDt4/xNbCV0srGJgFRtf3sLy0PbTg0Q6
 XwhSs6Har2eyMs/KI79tvSh77gD2qoTQLFeN0EfDqQv/NziOuU526D2Pdh1wKABK7sVwlfP8vNG
 qNSq8eZhTlMlyBbaqKbzFFLQG/j5VgvkK3DKGs5dceDgcuTb9fEpD8qeNEmZabV4KurgBmwlEtU
 0B2G9BdLriUFOoEGx8i8OG2qMsM4eSszExtNt5/Q0Iwn9gMdNjpr6OvZEAPLLsRlS2rR0qs4zcT
 pe2G1r3GlNEgnOtR78MfD3Vcb8SQh4Jc3mRlhPOMbcpc8rROqH7W5vAeflb7smDiofeVJdMSzDi
 SV3bXk6tN5CD6hg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
X-Rspamd-Queue-Id: 049E620EE8F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11574-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, 27 Feb 2026 07:37:58 +0100, Thomas Weißschuh <linux@weissschuh.net> wrote:
> Currently the test compilation of some UAPI headers requires a toolchain
> libc headers. Remove that dependency.

Thanks a lot for the highly appreciated clean up!  Having -nostdinc in
UAPI header tests is good thing!

Kind regards,
Nicolas

Reviewed-by: Nicolas Schier <nsc@kernel.org>
Tested-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas


