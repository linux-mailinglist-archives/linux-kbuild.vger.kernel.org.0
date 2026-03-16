Return-Path: <linux-kbuild+bounces-11958-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKJjC8kSuGk7YwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11958-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 15:25:13 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E3029B49B
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 15:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 753273004C9E
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 14:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338182701BB;
	Mon, 16 Mar 2026 14:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxrnmH/d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38AD278E5D;
	Mon, 16 Mar 2026 14:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773670730; cv=none; b=FYNLT28TwH7SQ/xp5k5zgVn5wtpg83Ey+hoR9fU1VBEXbyDMjBJxTuhXGpuV6hWzInQN2esHu6wQyIInUG2423GJR6dXed8rvLhFr7JLsINgKtyXYCVtwpd4Up7xa715jfUpsS4FUWV1vRRZzvwRANNhwPwZa6KSHTKS/FMjsWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773670730; c=relaxed/simple;
	bh=Eh6+Ra1uIlYoV+YML7v1kKQNweB0CJtWMN+N/yQcdzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gHLwLyyKbebdT6i4WFQ2LsKEhEp1/sh3cX6TcfKripIKKwSS15wnc7F357TRNv0zjlqR0idOTXhhUy8JFaqjwMTw4OoCXW+AmhOczOrVQY5vL7wwCYsW+BvxkqZAF4WkZE75qvei46ysO+X9/vCgw+txJe3xzxuIPLeyl1A1wyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxrnmH/d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F429C19421;
	Mon, 16 Mar 2026 14:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773670729;
	bh=Eh6+Ra1uIlYoV+YML7v1kKQNweB0CJtWMN+N/yQcdzE=;
	h=Date:From:To:Cc:Subject:From;
	b=TxrnmH/dVUDu3m++MUMtMz3CgTWQY7iU/Uvn5SDQG3CrFiNtJUHeMdY6bLLpf8nDe
	 7g62KK+5v9sWCDGQiYyy3/rhau0YEr2srSZ71AoCZRz/bqDowkEFSvRqHK0Ce2jF20
	 rRTrEGqmghd+rYB2GZ5BMf0pIZDJrNKRjIEoMiLd0lQz9EpK1+RZem4hTOUTs7V9Gn
	 fRbidD4B399xmmy8YtSxISSAKWOp4vmu7bK4dak/kUo94oeRxo3wZSGVeIjR3WNMgW
	 aG1YDr9kUWlDex1WC6ooM6Iyh6+6HeNJnXc0cCFgARv7GUD2eWkZwUBaTA2fFIfGxc
	 ECczPh1dzOcog==
Date: Mon, 16 Mar 2026 14:18:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Yonghong Song <yonghong.song@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kbuild tree
Message-ID: <abgRRX3PH9IaExi8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ud++p15tp78O80wH"
Content-Disposition: inline
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11958-lists,linux-kbuild=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 48E3029B49B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--Ud++p15tp78O80wH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the kbuild tree, today's linux-next build (arm64 perf)
failed like this:

Auto-detecting system features:
...                                   libdw: [ on  ]
...                                   glibc: [ on  ]
...                                  libelf: [ on  ]
...                                 libnuma: [ on  ]
...                  numa_num_possible_cpus: [ on  ]
...                               libpython: [ on  ]
...                             libcapstone: [ on  ]
...                               llvm-perf: [ on  ]
...                                    zlib: [ on  ]
...                                    lzma: [ on  ]
...                                     bpf: [ on  ]
...                                  libaio: [ on  ]
...                                 libzstd: [ on  ]
...                              libopenssl: [ on  ]
...                                    rust: [ on  ]

Makefile:2254: *** extraneous 'endif'.  Stop.
Makefile:2254: *** extraneous 'endif'.  Stop.
  PERF_VERSION = .gbc1f864a1976
52.34user 4.91system 0:56.88elapsed 100%CPU (0avgtext+0avgdata 140840maxresident)k
0inputs+0outputs (0major+1379795minor)pagefaults 0swaps
Building: arm64 allnoconfig
Makefile:2254: *** extraneous 'endif'.  Stop.

Presumably caused by commit

  6a76b3c06a1d3 (kbuild: Reduce the number of compiler-generated suffixes for clang thin-lto build)

though I don't immediately see how.  I have used the version from
next-20260313 instead.

--Ud++p15tp78O80wH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm4EUQACgkQJNaLcl1U
h9Dh4Af/cclyVX0ulliB623X6Ip6B0A/yvqphBaP5DPXq7eu5K1vy6hQo6pb0G2F
UNmuzPzcWda377ZU9AA3bgu4xmmECrncMWAW8XmvEJd+52dDpQqhliB1AabKzx4j
C1Ot/VlHNAKPUu+FzsSrXJbKnAq0ltm26u/mJ0y0TsIhx2hMSmvAMxd5QVx+25Uh
D/r6iXPRAHf3xnDkWDzDZtHpthJYdNUOhkwxO73GZm0qcTTBEl8nw8LuyILFRI+a
YSaAwa6i2fPBlZ2lJIXGudy8I3TH99vqvoBgDjX8tnglXTtH2CvQHhmnWG6ii5/s
zeLHbkahXMQJvr07Yg5IiXABkyR65A==
=8glC
-----END PGP SIGNATURE-----

--Ud++p15tp78O80wH--

