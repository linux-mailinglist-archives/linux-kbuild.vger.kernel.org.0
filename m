Return-Path: <linux-kbuild+bounces-11424-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBAdHa0fn2lcZAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11424-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 17:13:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA63319A54F
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 17:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9524730F9CC5
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 16:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714DE3D7D86;
	Wed, 25 Feb 2026 16:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=enakta-com.20230601.gappssmtp.com header.i=@enakta-com.20230601.gappssmtp.com header.b="u6Ym15Cy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278064315F
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Feb 2026 16:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772035741; cv=pass; b=UkVCPc4hCZJ3C3XVICHyfw3RL24VTmrHvTdN4/vkWeLg8AvbzIUF+YaH+pgsOU5BhRKm75ukk74eTy8aG9LL5d/zxzmJux44yoiUAro7yn+jp3pARnjCBTGMJwi2Jpz5dESK5QHcoh04AW85oQl9438+t4lOR5rV4DQEXfK3Jds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772035741; c=relaxed/simple;
	bh=OJR/Na+jj1LB/h3u5D1eUBs8kCJXr6Kb/poWvQIYOXY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JMaquxZ8KbyGqrKujLLK2kRtAV2anJBP1088xzfFUIa5MSe/iGhWq8Q+f1vXcsu4uKR36pNdFvd9Xy8zlfnxhx4zBP5XXlbFGLDeISwQM/483pB75z5oe6ZBWPro3EUkQM00suqJgHAoobKF9cCY/dido0YhuSYt/YOFtmwDmKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enakta.com; spf=pass smtp.mailfrom=enakta.com; dkim=pass (2048-bit key) header.d=enakta-com.20230601.gappssmtp.com header.i=@enakta-com.20230601.gappssmtp.com header.b=u6Ym15Cy; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enakta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enakta.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3590c295150so466628a91.1
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Feb 2026 08:08:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772035739; cv=none;
        d=google.com; s=arc-20240605;
        b=C9bdpL14SCKEdmUOqULOJ2nczoXgBdoesgCeRvyrESHURoBidW2gU67eJSr+QwoM0x
         zOWX+IWRO+Vw4l8KM8gBQuF5zmsrO1chl9hvgoh7/iFZpxw3SJc0IJB7SzqHi/TkMYLE
         zE7EJi5DUMtCL/eqfRdW63us9n23nCBYUfF1z/6FcE0gAhvAVRPMqfpB0YBU7DAhjYYa
         gSgIwf7ndxHMX5DsKT+lpso5haqvsO1jZqRC49FRouFpA/GHsQJYiS+2Zg8Q0Q5ngc9Z
         gLsk05KGN/PAwD0ZF9iokc10o0bwe2cuIi+hnvYISeCX9Dv7SjfTgr0B/0ldLyrNd/3X
         6r5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=ah0/yq8Nlk6MI5dpLakiuQu8LX7seLqUlMO4deqe/88=;
        fh=GDqh/0K3v9Y9Wx90O3CIZberl/XG8kl+NaULbeuiC6g=;
        b=cy9t9o3nRHqp/jYJ08MFDmVvox3PdeuifiuIgnFGXHqkmoPVCYtBbf+9qR6LDzRZQZ
         gZBu9U4XTXWsBEYgR5ZOMJ3f8pQn91Fn00ptFdm2tDXCDEIffO8NoLaZdh4eaao1Mnny
         cKoQhsTuDSrG754tpl6CGMzLGWEFfzUn4rmx5OlX12pGjUXquH0tSppRk70NmYcWPGsT
         ViueoN+4WVznSzCsh+3XoHzYvO9mMRfPNtQ5b26YIFACSyeChA1qjaDUVnIbGo0zPF1o
         ZYOMhqJAgzBguu0d9ICzIPRCS/7SSatLC4enu9LY5M6utAgT3j706nxiDSK6+sSVbxa7
         tniA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=enakta-com.20230601.gappssmtp.com; s=20230601; t=1772035739; x=1772640539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ah0/yq8Nlk6MI5dpLakiuQu8LX7seLqUlMO4deqe/88=;
        b=u6Ym15Cyc13P5a1HHm40nlLeXKLnyxGUxPYwBMe+iumHPfeQcQm8YZKyihjvzoOfjH
         vlb19Xb5gJNhe9sJAtf+CnLdYa+ZJg/4UcelP9dqezKfIRslTqScQTLS92iALVjbNbfS
         mVHBvyvpFtQjVs40d6hYGzYelrXprz0JzYB3v6TYN8PrWpzKP3wOB2zz4nkMKTrmdaiO
         Uqe4KO6ixYle5N0VesSJU6pRZLKPivVZgCBs20zvB9FH0CshhP+NnhpaSVz5V8NX2gDB
         C6KHVRFeOf/Vqs9cLTw5eFmQ2hmfb4Vkm9EpjS0gQs0ehtM84cI/ehCIrR3NDC8iRjEe
         Gk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772035739; x=1772640539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ah0/yq8Nlk6MI5dpLakiuQu8LX7seLqUlMO4deqe/88=;
        b=jpbHf6SQtla/A8eMoqcTj1+MFAA2OarW397W0qP1fTttvj5k5Xx2eqmsHFxr0Fw3Wn
         R6p6UU53AMlt+e8U4GRep+Esxlh4hHPTzu/Y0Jx7WgONYHUgNDW0YMKfzMVKKVWtk9fQ
         DwpxeUo1mIy5jVVGgm0pG+9PDcf+H3Py8qDfzlFsoytFoZFJu2KqbzeeK5Okkn76YWd0
         pbGNNEMP0S7j/tGuisuBtimRTdFtpXFqpFMIyQbvUT+gnj7cwgsub7fV3ryd5kVbV8b7
         okQrH2FL6s9eanWsAtwcnotkQE+SE2b5bN0UPW0PHLV+d5Skm6ScK0LBA1c7D/1yydH9
         oxpg==
X-Gm-Message-State: AOJu0YzAXZRzX0Y8hytsttbeV0vAqkLcdPTbDdJk2+uqDJd0sGJQSWUM
	gxEI5vXiJlQjFGpiTKmMkVJgNbqR/XN2Kc64OQ3IKplU1FlwFI+1s3sMgUAXb+4UWULOSKlrsDs
	3X/MfCCBTHkaoZ1yw+n7x8wNR/nSNRM8NDFZrNXPlYw==
X-Gm-Gg: ATEYQzzyH/M+25M4+j8epRZsOvTjGUQ50fu3BY/kSodeN3mKcnG3O7d1j9qs/GrqHnz
	MhpFz2v/POcIaTdL9wxM4+1sKBcFaRUoVQqNr/xMfn2zvXp6gBXXuHEQSS0wmQOJiwNjsHh7tf9
	dmCPeFeu2pW2KWKlFFlVLNgmKKdBy3j5wdge4xVSIkdXonPmi9vhRF0MIVcXa9s+KiqMPKVbTZd
	gH6bJFovZteS1RyT3SYdI0oky9j+Rcq+2kc3xqDBcVc12SW6Tt88rdQja6o5XU1CF+Libnhpc7d
	d5OuNsdftlf1Fdy2AKbW1/8Uz0kpuA+/9kyxp6mv+rrKN+/1mcs+YWvZvmcOYfSS3fOo
X-Received: by 2002:a17:90b:2c85:b0:34c:c514:ee1f with SMTP id
 98e67ed59e1d1-358ae7fad35mr16348915a91.11.1772035739446; Wed, 25 Feb 2026
 08:08:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Denis Nuja <dnuja@enakta.com>
Date: Wed, 25 Feb 2026 16:08:48 +0000
X-Gm-Features: AaiRm50bgAoWq_guOYBnqprlZlHDx8z0DldaUjaWF61VHeQDHWcCHk45cLgbluA
Message-ID: <CAGk60SF8WxDMpx1ALrne40qycg5J-hxdBniFnoYG=QhvnX5ktQ@mail.gmail.com>
Subject: Kconfig: CONFIG_CIFS_SMB_DIRECT bool option silently dropped when
 CIFS=m and INFINIBAND=m
To: linux-cifs@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, stfrench@microsoft.com, 
	Ned Pyle <ned.pyle@tuxera.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[enakta-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[enakta.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-11424-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[enakta-com.20230601.gappssmtp.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dnuja@enakta.com,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CA63319A54F
X-Rspamd-Action: no action

Hi everyone

CONFIG_CIFS_SMB_DIRECT cannot be enabled when CONFIG_CIFS=3Dm and
CONFIG_INFINIBAND=3Dm, despite all declared dependencies being
satisfied. The option is silently dropped by olddefconfig and
menuconfig refuses to save it, even though menuconfig displays it as
[*] (enabled).

Kernel version: 6.4.0

File: fs/smb/client/Kconfig

Current dependency:

if CIFS
config CIFS_SMB_DIRECT
    bool "SMB Direct support"
    depends on CIFS=3Dm && INFINIBAND && INFINIBAND_ADDR_TRANS || CIFS=3Dy
&& INFINIBAND=3Dy && INFINIBAND_ADDR_TRANS=3Dy

Root cause:

CIFS_SMB_DIRECT is declared as bool (values: n or y only). With CIFS=3Dm
and INFINIBAND=3Dm, the left side of the || expression evaluates to:

CIFS=3Dm && INFINIBAND && INFINIBAND_ADDR_TRANS
=3D m && m && y =3D m

The result is m (tristate), but since CIFS_SMB_DIRECT is a bool, the
Kconfig engine coerces m to n and silently drops the option. The right
side of the || requires CIFS=3Dy && INFINIBAND=3Dy which forces both to be
built-in =E2=80=94 an unnecessarily restrictive requirement.

Additionally, the CIFS=3Dm/y conditions inside the depends on are
redundant since the option is already inside an if CIFS block, which
handles that guard.

Observed behaviour:

menuconfig shows [*] SMB Direct support (appears enabled)
Saving from menuconfig does not write CONFIG_CIFS_SMB_DIRECT=3Dy to .config
olddefconfig emits warning: override: reassigning to symbol
CIFS_SMB_DIRECT and drops it
scripts/config --enable CONFIG_CIFS_SMB_DIRECT silently has no effect

Proposed fix:

Since the option is inside if CIFS, the CIFS=3Dm/y conditions are
redundant. The dependency should simply be:

- depends on CIFS=3Dm && INFINIBAND && INFINIBAND_ADDR_TRANS || CIFS=3Dy
&& INFINIBAND=3Dy && INFINIBAND_ADDR_TRANS=3Dy
+ depends on INFINIBAND && INFINIBAND_ADDR_TRANS

This correctly expresses the intent (RDMA stack must be present)
without the tristate/bool coercion problem, and is consistent with how
the surrounding if CIFS block already guards the option.

The same issue affects CONFIG_CIFS_FSCACHE on line 191 with an
identical pattern:

depends on CIFS=3Dm && FSCACHE || CIFS=3Dy && FSCACHE=3Dy

which should also be simplified to:

depends on FSCACHE

To reproduce:

# Start with a config where CONFIG_CIFS=3Dm, CONFIG_INFINIBAND=3Dm
scripts/config --enable CONFIG_CIFS_SMB_DIRECT
make olddefconfig
grep SMBDIRECT .config   # empty =E2=80=94 option was dropped


Cheers
Denis
Enakta Labs

